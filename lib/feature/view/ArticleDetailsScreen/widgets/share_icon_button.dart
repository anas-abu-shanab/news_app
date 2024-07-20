import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimen.dart';

class ShareIconButton extends StatelessWidget {
  const ShareIconButton({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Share.share(url);
        },
        child: Icon(
          Icons.share,
          color: AppColors.blackColor(context),
          size: AppDimen.h30,
        ));
  }
}