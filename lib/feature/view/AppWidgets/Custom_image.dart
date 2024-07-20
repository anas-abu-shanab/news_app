import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/assets_manager.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {super.key,
      required this.imageType,
      required this.imageSrc,
      this.errorImageSrc,
      this.width,
      this.height,
      this.fit,
      this.borderRadius});

  final int
      imageType; // imageType = 0 : AssetImage || imageType = 1 : NetworkImage
  final String imageSrc;
  final String? errorImageSrc;
  final double? width;
  final double? borderRadius;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (imageType == 0) {
      return Container(
        width: width,
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: Image.asset(
          imageSrc,
          fit: fit,
        ),
      );
    } else if (imageType == 1) {
      return Container(
        width: width,
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: CachedNetworkImage(
          imageUrl: imageSrc,
          errorWidget: (context, url, error) {
            return Image.asset(
              errorImageSrc ?? AppMedia.noImageNews,
              fit: fit,
            );
          },
          width: width ?? 74,
          height: height ?? 74,
          fit: fit ?? BoxFit.cover,
          placeholder: (context, String? url) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(AppMedia.loadingShimmer),
                  fit: fit ?? BoxFit.cover,
                ),
              ),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
