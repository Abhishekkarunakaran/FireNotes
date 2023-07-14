// ignore_for_file: prefer_const_constructors

import 'package:fire_notes/app/shared/dependencies.dart';

import '../../theme/text_color_theme.dart';

class NoteCard extends StatelessWidget {
  String title;
  String content;
  VoidCallback onPressed;
  NoteCard({super.key, required this.title,required this.content, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: CT.noteCard),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: title.isNotEmpty,
              child: Text(
                title,
                maxLines: null,
                style: TT.noteCardTitle,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Visibility(
              visible: content.isNotEmpty,
              child: Text(
                content,
                maxLines: 6,
                style: TT.noteCardStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
