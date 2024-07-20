import 'package:flutter/material.dart';

import '../../../utils/assets_manager.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key, this.width, this.height,});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppMedia.loadingShimmer,
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }
}
