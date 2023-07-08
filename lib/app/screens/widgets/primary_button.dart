// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:fire_notes/app/shared/dependencies.dart';

class PrimaryButton extends StatelessWidget {

  Widget text;
  Color buttonColor;
  VoidCallback function;
  PrimaryButton({super.key,required this.text, this.buttonColor=const Color(0xFF59BAAB),required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: function,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: text),
        ),
      ),
    );
  }
}
