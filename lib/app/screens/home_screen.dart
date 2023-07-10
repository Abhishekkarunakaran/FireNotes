// ignore_for_file: prefer_const_constructors

import 'package:fire_notes/app/shared/dependencies.dart';
import 'package:fire_notes/app/theme/text_color_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List noteList = [
      r"I'm trying to create a dynamic link in Firebase, when I'm selecting the android app, it shows an error saying Add SHA-1 to this android app, I've already added a credential, but I'm not sure how exactly do I add SHA-1 to the app",
      r"Check this to get SHA-1 key from your android studio and add it to your firebase project –",
      r"Now, you will see BUILD SUCCESSFUL in the Run window that you can open from bottom just scroll that window upward and you will find your SHA1 key there. Add this key to firebase",
      r"I'm trying to create a dynamic link in Firebase, when I'm selecting the android app, it shows an error saying Add SHA-1 to this android app, I've already added a credential, but I'm not sure how exactly do I add SHA-1 to the app",
      r"Check this to get SHA-1 key from your android studio and add it to your firebase project –",
      r"Now, you will see BUILD SUCCESSFUL in the Run window that you can open from bottom just scroll that window upward and you will find your SHA1 key there. Add this key to firebase",
      r"I'm trying to create a dynamic link in Firebase, when I'm selecting the android app, it shows an error saying Add SHA-1 to this android app, I've already added a credential, but I'm not sure how exactly do I add SHA-1 to the app",
      r"Check this to get SHA-1 key from your android studio and add it to your firebase project –",
      r"Now, you will see BUILD SUCCESSFUL in the Run window that you can open from bottom just scroll that window upward and you will find your SHA1 key there. Add this key to firebase",
      r"I'm trying to create a dynamic link in Firebase, when I'm selecting the android app, it shows an error saying Add SHA-1 to this android app, I've already added a credential, but I'm not sure how exactly do I add SHA-1 to the app",
      r"Check this to get SHA-1 key from your android studio and add it to your firebase project –",
      r"Now, you will see BUILD SUCCESSFUL in the Run window that you can open from bottom just scroll that window upward and you will find your SHA1 key there. Add this key to firebase",
    ];
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: SizedBox(
              height: 500,
              child: SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: noteList.length,
                  itemBuilder: (ctx, i) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CT.noteCard),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        noteList[i],
                        maxLines: 6,
                        style: TT.noteCardStyle,
                      ),
                    );
                  },
                  separatorBuilder: (ctx, _) => SizedBox(
                    height: 15,
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
          backgroundColor: CT.primary,
          onPressed: () {
            //TODO: Add new notes functionality
          },
          child: Center(
              child: Icon(
            Icons.add,
            color: Colors.white,
          ))),
    );
  }
}
