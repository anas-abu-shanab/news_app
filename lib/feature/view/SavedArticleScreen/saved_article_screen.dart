import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/feature/view/AppWidgets/custom_text_view.dart';
import 'package:news_app/utils/app_strings.dart';

import '../../../utils/app_dimen.dart';
import '../../../utils/app_style.dart';
import '../../view_model/article_details_view_model.dart';
import '../AppWidgets/custom_app_bar.dart';
import '../HomeScreen/widgets/news_card_widget.dart';

class SavedArticleScreen extends StatelessWidget {
  const SavedArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleDetailsViewModel>(builder: (logic) {
      return Scaffold(
        appBar: CustomAppBar(
          height: AppDimen.h50,
          isCenterTitle: true,
          titleWidget: CustomTextView(
            txt: AppStrings.txtSaved,
            textStyle: AppTextStyle.titleDetailsTextStyle(),
          ),
        ),
        body: logic.savedArticles.isEmpty
            ? Center(
                child: CustomTextView(
                  txt: AppStrings.txtEmptySaved,
                  textStyle: AppTextStyle.emptySavedTextStyle(),
                ),
              )
            : SingleChildScrollView(
                physics: AppStyleScroll.customScrollViewIOS(),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppDimen.h20,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: logic.savedArticles.length,
                      itemBuilder: (context, i) {
                        return NewsCardWidget(article: logic.savedArticles[i]);
                      },
                      separatorBuilder: (context, i) {
                        return SizedBox(
                          height: AppDimen.h20,
                        );
                      },
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
