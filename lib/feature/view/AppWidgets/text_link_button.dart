import 'package:flutter/material.dart';

import '../../../utils/app_share_method.dart';
import '../../../utils/app_style.dart';
import 'custom_text_view.dart';

class TextLinkButton extends StatelessWidget {
  final String text;
  final String? link;
  final TextStyle? textStyle;

  const TextLinkButton({
    super.key,
    required this.text,
    this.link,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openStringLink(link ?? text);
      },
      child: CustomTextView(
        txt: text,
        textStyle:textStyle ?? AppTextStyle.linkTextStyle(),
      ),
    );
  }
}