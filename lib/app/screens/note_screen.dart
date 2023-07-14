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
                        Navigator.pop(context);
                      }
                    } else {
                      NoteServices.addNote(
                        titleController.text,
                        contentController.text,
                      );
                      Navigator.pop(context);
                    }
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
                  TextField(
                    controller: titleController,
                    style: TT.titleStyle,
                    cursorColor: CT.primary,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TT.titleHint,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: contentController,
                    style: TT.contentStyle,
                    maxLines: null,
                    cursorColor: CT.primary,
                    decoration: InputDecoration(
                        hintText: 'note',
                        hintStyle: TT.contentHint,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
                  )
                ],
              )),
            ),
          )
        ]),
      ),
    );
  }
}
