
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimen.dart';
import '../../../model/news_model.dart';
import '../../../view_model/article_details_view_model.dart';

class SaveIconButton extends StatefulWidget {
  const SaveIconButton({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  State<SaveIconButton> createState() => _SaveIconButtonState();
}

class _SaveIconButtonState extends State<SaveIconButton> {

  bool isSaved = false;
  ArticleDetailsViewModel logic = Get.find<ArticleDetailsViewModel>();

  @override
  Widget build(BuildContext context) {
    isSaved = logic.savedArticles.contains(widget.article);
    return GestureDetector(
      onTap: () {
        logic.onSaveClick(widget.article);
      },
      child: Icon(
        isSaved ? Icons.bookmark : Icons.bookmark_outline,
        color: AppColors.colorPrimary(context),
        size: AppDimen.h30,
      ),
    );
  }
}
