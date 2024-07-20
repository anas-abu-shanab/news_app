import 'package:flutter/material.dart';

import '../../../utils/app_dimen.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? isCenterTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? titleWidget;
  final double? titleSize;
  final double? elevation;
  final double? height;
  final Color? color;

  const CustomAppBar({
    super.key,
    this.isCenterTitle = false,
    this.actions,
    this.leading,
    this.color,
    this.elevation,
    this.titleSize,
    this.height,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      title: titleWidget,
      centerTitle: isCenterTitle,
      backgroundColor: color,
      elevation: elevation ?? 0,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? AppDimen.h70);

}
