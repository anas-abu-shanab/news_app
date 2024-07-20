
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/feature/view/HomeScreen/shimmer/news_list_shimmer.dart';
import 'package:news_app/feature/view/HomeScreen/widgets/home_app_bar.dart';
import 'package:news_app/feature/view/HomeScreen/widgets/news_card_widget.dart';
import 'package:news_app/feature/view_model/home_view_model.dart';
import 'package:news_app/utils/app_dimen.dart';

import '../../../utils/app_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = Get.find<HomeViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (homeViewModel.articles.isEmpty) {
      homeViewModel.getNews();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(builder: (logic) {
      return Scaffold(
        appBar: const HomeAppBar(),
        body: logic.isLoading
            ? const NewsListShimmer()
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
                      itemCount: logic.articles.length,
                      itemBuilder: (context, i) {
                        return NewsCardWidget(article: logic.articles[i]);
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




