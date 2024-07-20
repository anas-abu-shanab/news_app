import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/feature/view/AppWidgets/custom_app_bar.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_dimen.dart';
import 'package:news_app/utils/app_strings.dart';

import '../../../utils/app_share_method.dart';
import '../../../utils/app_style.dart';
import '../../model/news_model.dart';
import '../../view_model/article_details_view_model.dart';
import '../AppWidgets/Custom_image.dart';
import '../AppWidgets/text_link_button.dart';
import '../AppWidgets/custom_text_view.dart';
import 'widgets/save_icon_button.dart';
import 'widgets/share_icon_button.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final Article article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  ArticleDetailsScreenState createState() => ArticleDetailsScreenState();
}

class ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleDetailsViewModel>(
      builder: (logic) {
        return Scaffold(
          appBar: CustomAppBar(
            height: AppDimen.h50,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimen.w15),
            child: Column(
              children: [
                SizedBox(
                  height: AppDimen.h20,
                ),
                detailsTopIconsWidget,
                SizedBox(
                  height: AppDimen.h20,
                ),
                CustomTextView(
                  txt: widget.article.title,
                  textStyle: AppTextStyle.titleDetailsTextStyle(),
                ),
                SizedBox(
                  height: AppDimen.h20,
                ),
                CustomImage(
                  imageType: 1,
                  imageSrc: widget.article.image ?? '',
                  width: double.infinity,
                  height: AppDimen.h200,
                  fit: BoxFit.fill,
                  borderRadius: SizeRadius.sizeRadius10,
                ),
                SizedBox(
                  height: AppDimen.h20,
                ),
                detailsContentWidget,
                const Spacer(),
                detailsDateWidget,
                SizedBox(
                  height: AppDimen.h20,
                )
              ],
            ),
          ),
        );
      }
    );
  }

  Widget get detailsDateWidget => Row(
    children: [
      CustomTextView(
        txt: AppStrings.txtFrom,
        textStyle: AppTextStyle.dateDetailsTextStyle()!
            .copyWith(color: AppColors.colorTextHint(context)),
      ),
      TextLinkButton(
        text: widget.article.source?.name ?? '',
        textStyle: AppTextStyle.linkDetailsTextStyle(),
        link: widget.article.source?.url,

      ),
      const Spacer(),
      CustomTextView(
        txt:
        getNewsDate(widget.article.publishedAt ?? DateTime.now()),
        textStyle: AppTextStyle.dateDetailsTextStyle(),
      ),
    ],
  );

  Widget get detailsContentWidget => SizedBox(
    height: AppDimen.h370,
    child: SingleChildScrollView(
      physics: AppStyleScroll.customScrollViewIOS(),
      child: Column(
        children: [
          CustomTextView(
            txt:
            "${widget.article.content}\n \n${widget.article.description}",
            textStyle: AppTextStyle.contentDetailsTextStyle(),
          ),
          SizedBox(
            height: AppDimen.h20,
          ),
          TextLinkButton(
            text: widget.article.url ?? '',
            textStyle: AppTextStyle.linkDetailsTextStyle(),
          ),
        ],
      ),
    ),
  );

  Widget get detailsTopIconsWidget => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SaveIconButton(
        article: widget.article,
      ),
      ShareIconButton(
        url: widget.article.url ?? '',
      ),
    ],
  );
}




