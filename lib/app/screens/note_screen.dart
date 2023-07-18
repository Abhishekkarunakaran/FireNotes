// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:fire_notes/app/shared/dependencies.dart';
import 'package:fire_notes/app/theme/text_color_theme.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({
    super.key,
    // this.isExisting = false,
    // this.index,
  });

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  // late DateTime editedDateTime;
  String editedDateTime = '';

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    if (arguments['isExisting']) {
      titleController.text = arguments['title'];
      contentController.text = arguments['content'];
      editedDateTime = arguments['editedDateTime'];
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: CT.black,
        body: Stack(children: [
          Positioned(
              top: 20,
              left: 10,
              child: IconButton(
                  onPressed: () {
                    // Save and exit
                    if (arguments['isExisting']) {
                      if (arguments['title'] != titleController.text ||
                          arguments['content'] != contentController.text) {
                        NoteServices.updateData(arguments['docId'], {
                          'title': titleController.text,
                          'content': contentController.text,
                          'updatedAt': DateTime.now()
                        });
                      }
                    } else if (titleController.text.isNotEmpty ||
                        contentController.text.isNotEmpty) {
                      NoteServices.addNote(
                        titleController.text,
                        contentController.text,
                      );
                    }
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ))),
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
                Icons.delete_outlined,
                size: 25,
                color: Colors.white,
              ),
              onPressed: () {
                NoteServices.deleteNote(arguments['docId']);
                Navigator.pop(context);
              },
            ),
          ),
          Positioned.fill(
            top: 100,
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title field
                  NoteTakingTextField(
                    controller: titleController,
                    textStyle: TT.titleStyle,
                    hintText: 'Title',
                    hintStyle: TT.titleHint,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Content field
                  NoteTakingTextField(
                      controller: contentController,
                      textStyle: TT.contentStyle,
                      hintStyle: TT.contentHint,
                      hintText: 'note'),
                ],
              )),
            ),
          )
        ]),
        bottomNavigationBar: Visibility(
          visible: editedDateTime != '',
          child: SizedBox(
            height: 30,
            child: Center(
              child: Text('Edited $editedDateTime',style: TextStyle(color: Colors.white54),),
            ),
          ),
        ),
      ),
    );
  }
}
