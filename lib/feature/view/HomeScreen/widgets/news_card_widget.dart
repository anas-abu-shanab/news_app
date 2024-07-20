import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/feature/model/news_model.dart';
import 'package:news_app/utils/app_colors.dart';

import '../../../../utils/app_dimen.dart';
import '../../../../utils/app_share_method.dart';
import '../../../../utils/app_style.dart';
import '../../AppWidgets/Custom_image.dart';
import '../../AppWidgets/text_link_button.dart';
import '../../AppWidgets/custom_text_view.dart';
import '../../ArticleDetailsScreen/article_details_screen.dart';
import '../../ArticleDetailsScreen/binding/ArticleDetails_binding.dart';

class NewsCardWidget extends StatelessWidget {
  final Article article;

  const NewsCardWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            () => ArticleDetailsScreen(
                  article: article,
                ),
            binding: ArticleDetailsBinding());
      },
      child: Container(
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
              imageType: 1,
              imageSrc: article.image ?? '',
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
              children: [
                SizedBox(
                  width: AppDimen.w230,
                  child: CustomTextView(
                    txt: article.title,
                    maxLine: 2,
                    textOverflow: TextOverflow.visible,
                    textStyle: AppTextStyle.titleTextStyle(),
                  ),
                ),
                SizedBox(
                  height: AppDimen.h5,
                ),
                SizedBox(
                  width: AppDimen.w230,
                  child: CustomTextView(
                    txt: article.content,
                    maxLine: 3,
                    textOverflow: TextOverflow.ellipsis,
                    textStyle: AppTextStyle.contentTextStyle(),
                  ),
                ),
                SizedBox(
                  height: AppDimen.h15,
                ),
                Container(
                  width: AppDimen.w230,
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextLinkButton(
                        text: article.source?.name ?? '',
                        link: article.source?.url,
                      ),
                      CustomTextView(
                        txt: getNewsDate(article.publishedAt ?? DateTime.now()),
                        textStyle: AppTextStyle.dateTextStyle(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
