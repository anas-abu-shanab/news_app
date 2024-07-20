import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/feature/view/ArticleDetailsScreen/binding/ArticleDetails_binding.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimen.dart';
import '../../../../utils/app_share_method.dart';
import '../../AppWidgets/Custom_image.dart';
import '../../AppWidgets/custom_app_bar.dart';
import '../../SavedArticleScreen/saved_article_screen.dart';
import 'change_theme_icon.dart';

class HomeAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      titleWidget: CustomImage(
        imageType: 0,
        imageSrc: getAppLogoSrc(),
        height: AppDimen.h50,
      ),
      leading: const ChangeThemeIcon(),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: AppDimen.w15),
          child: GestureDetector(
            onTap: () {
              Get.to(()=>const SavedArticleScreen(),binding: ArticleDetailsBinding());
            },
            child: Icon(
              Icons.bookmark,
              color: AppColors.blackColor(context),
            ),
          ),
        ),
      ],
      isCenterTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppDimen.h50);
}