// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_notes/app/shared/dependencies.dart';
import 'package:fire_notes/app/theme/text_color_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    return Scaffold(
      backgroundColor: CT.black,
      body: Stack(children: [
        Positioned(top: 30, left: 20, child: WT.appBarLogo),
        Positioned(
          top: 0,
          right: 20,
          child: Image.asset('assets/img/2.png'),
        ),
        Positioned(
          top: 25,
          right: 35,
          child: IconButton(
            icon: Icon(
              Icons.logout_rounded,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {
              //TODO: Add logout function
              FirebaseAuthService.signOut(context);
            },
          ),
        ),
        Positioned.fill(
          top: 100,
          bottom: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: StreamBuilder(
                  stream: NoteServices.getFireStoreStream(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> streamSnap) {
                    if (streamSnap.hasError) {
                      return Center(
                        child: Text(
                          'Some error occurred',
                          style: TT.noNotes,
                        ),
                      );
                    }
                    if (streamSnap.hasData) {
                      log(streamSnap.data!.docs.length.toString());
                      if (streamSnap.data!.docs.isEmpty) {
                        return Center(
                          child: Text(
                            'No notes found',
                            style: TT.noNotes,
                          ),
                        );
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: streamSnap.data!.docs.length,
                        itemBuilder: (ctx, i) {
                          final Map<String,dynamic> docSnap =
                              streamSnap.data!.docs[i].data() as Map<String,dynamic>;
                          return NoteCard(
                            title: docSnap['title'],
                            content: docSnap['content'],
                            onPressed: () {
                              Navigator.pushNamed(context, '/note', arguments: {
                                'isExisting': true,
                                'title': docSnap['title'],
                                'content': docSnap['content'],
                                'docId': streamSnap.data!.docs[i].id,
                                'editedDateTime': NoteServices.processDate(
                                  docSnap.containsKey('updatedAt')? docSnap['updatedAt']:docSnap['createdAt']
                                ),
                              });
                            },
                          );
                        },
                        separatorBuilder: (ctx, _) => SizedBox(
                          height: 15,
                        ),
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(
                        color: CT.primary,
                      ),
                    );
                  }),
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
          backgroundColor: CT.primary,
          onPressed: () {
            Navigator.pushNamed(context, '/note', arguments: {
              'isExisting': false,
            });
          },
          child: Center(
              child: Icon(
            Icons.add,
            color: Colors.white,
          ))),
    );
  }
}
