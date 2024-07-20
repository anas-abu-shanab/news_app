import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/assets_manager.dart';

import '../../../../utils/app_dimen.dart';
import '../../../../utils/app_style.dart';
import '../../AppWidgets/Custom_image.dart';
import '../../AppWidgets/loading_shimmer.dart';

class NewsCardShimmer extends StatelessWidget {
  const NewsCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppDimen.h158,
      margin: EdgeInsets.symmetric(horizontal: AppDimen.w10),
      padding: EdgeInsets.symmetric(
          horizontal: AppDimen.w10, vertical: AppDimen.h5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeRadius.sizeRadius10),
        boxShadow: [
          AppShadow.newsCardShadow(),
        ],
        color: AppColors.newsCardColor(context),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            imageType: 0,
            imageSrc: AppMedia.loadingShimmer,
            width: AppDimen.w125,
            height: AppDimen.h140,
            fit: BoxFit.fill,
            borderRadius: SizeRadius.sizeRadius10,
          ),
          SizedBox(
            width: AppDimen.w5,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: AppDimen.w230,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(SizeRadius.sizeRadius10),
                  child: LoadingShimmer(
                    height: AppDimen.h20,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(
                height: AppDimen.h5,
              ),
              SizedBox(
                width: AppDimen.w200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(SizeRadius.sizeRadius10),
                  child: LoadingShimmer(
                    height: AppDimen.h20,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(
                height: AppDimen.h15,
              ),
              SizedBox(
                width: AppDimen.w230,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(SizeRadius.sizeRadius10),
                  child: LoadingShimmer(
                    height: AppDimen.h10,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(
                height: AppDimen.h5,
              ),
              SizedBox(
                width: AppDimen.w230,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(SizeRadius.sizeRadius10),
                  child: LoadingShimmer(
                    height: AppDimen.h10,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(
                height: AppDimen.h5,
              ),
              SizedBox(
                width: AppDimen.w200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(SizeRadius.sizeRadius10),
                  child: LoadingShimmer(
                    height: AppDimen.h10,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(
                height: AppDimen.h20,
              ),
              Container(
                width: AppDimen.w230,
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: AppDimen.w80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(SizeRadius.sizeRadius10),
                        child: LoadingShimmer(
                          height: AppDimen.h10,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppDimen.w80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(SizeRadius.sizeRadius10),
                        child: LoadingShimmer(
                          height: AppDimen.h10,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}