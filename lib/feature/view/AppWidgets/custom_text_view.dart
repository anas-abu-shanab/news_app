// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget {
  final String? txt;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final int? maxLine;
  final TextOverflow? textOverflow;
  final bool? IsUpperCase, softWrap;

  const CustomTextView({
    super.key,
    this.txt,
    this.textAlign,
    this.textStyle,
    this.maxLine,
    this.textOverflow,
    this.IsUpperCase = false,
    this.softWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      IsUpperCase! ? txt!.toUpperCase() : txt ?? "",
      overflow: textOverflow,
      softWrap: softWrap,
      textAlign: textAlign,
      style: textStyle,
      maxLines: maxLine,
    );
  }
}
