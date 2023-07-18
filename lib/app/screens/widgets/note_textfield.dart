// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:fire_notes/app/theme/text_color_theme.dart';
import 'package:flutter/material.dart';

class NoteTakingTextField extends StatelessWidget {
  TextEditingController controller;
  TextStyle textStyle;
  TextStyle hintStyle;
  String hintText;
  NoteTakingTextField({super.key, required this.controller,required this.textStyle,required this.hintStyle, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
                    controller: controller,
                    style: textStyle,
                    cursorColor: CT.primary,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: hintStyle,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                  );
  }
}