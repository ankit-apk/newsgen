import 'package:flutter/material.dart';
import 'package:newsgen/news/models/news_model.dart';
import 'package:sizer/sizer.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({
    Key? key,
    required this.newsModel,
    required this.index,
  }) : super(key: key);
  final NewsModel newsModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            newsModel.articles![index].urlToImage.toString(),
            height: 30.h,
            width: 90.w,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            newsModel.articles![index].description.toString(),
          )
        ],
      ),
    );
  }
}
