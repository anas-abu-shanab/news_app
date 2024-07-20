import 'package:flutter/material.dart';
import 'package:news_app/feature/view/HomeScreen/shimmer/news_card_shimmer.dart';
import 'package:news_app/utils/app_dimen.dart';

class NewsListShimmer extends StatelessWidget {
  const NewsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: AppDimen.h20,),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context , i){
              return const NewsCardShimmer();
            },
            separatorBuilder: (context , i){
              return SizedBox(height: AppDimen.h20,);
            },
          ),
        ],
      ),
    );
  }
}
