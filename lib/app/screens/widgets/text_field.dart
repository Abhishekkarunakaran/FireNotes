// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:fire_notes/app/shared/dependencies.dart';
import 'package:fire_notes/app/theme/text_color_theme.dart';

class NoteTextField extends StatelessWidget {
  String title;
  String? hintText;
  TextEditingController textEditingController;
  String? Function(String?)? validator;
  bool? needNext;

  NoteTextField(
      {super.key,
      required this.title,
      this.hintText,
      required this.textEditingController,
      required this.validator,
      this.needNext=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TT.textFieldTitle,
          ),
          SizedBox(height: 15),
          TextFormField(
            validator: validator,
            textInputAction:
                needNext! ? TextInputAction.next : TextInputAction.none,
            style: TT.textFieldStyle,
            controller: textEditingController,
            cursorColor: Colors.white,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
