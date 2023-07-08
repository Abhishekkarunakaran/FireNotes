// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:fire_notes/app/shared/dependencies.dart';
import 'package:fire_notes/app/theme/text_color_theme.dart';

class NotePwdField extends StatefulWidget {
  String title;
  String? hintText;
  TextEditingController textEditingController;
  bool needNext;
  String? Function(String?)? validator;

  NotePwdField(
      {super.key,
      required this.title,
      this.hintText,
      required this.textEditingController,
      this.needNext = false,
      required this.validator});

  @override
  State<NotePwdField> createState() => _NotePwdFieldState();
}

class _NotePwdFieldState extends State<NotePwdField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TT.textFieldTitle,
          ),
          SizedBox(height: 15),
          TextFormField(
            validator: widget.validator,
            textInputAction: widget.needNext? TextInputAction.next : TextInputAction.none,
            style: TT.textFieldStyle,
            controller: widget.textEditingController,
            cursorColor: Colors.white,
            obscureText: obscure,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        if (obscure) {
                          obscure = false;
                        } else {
                          obscure = true;
                        }
                      });
                    },
                    icon: obscure
                        ? Icon(
                            Icons.visibility,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          )),
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
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
