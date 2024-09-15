import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/Core/AppRouter/PageRoute.dart';
import 'package:news_app/Feature/HomeScreen/Widget/CustomArticleItem.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Models/articles_model.dart';

class CustomArticlesListView extends StatefulWidget {
  CustomArticlesListView({super.key, required this.articles});

  List<Article> articles;

  @override
  State<CustomArticlesListView> createState() => _CustomArticlesListViewState();
}

class _CustomArticlesListViewState extends State<CustomArticlesListView> {
  @override
  bool isLoading = true;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        enabled: isLoading,
        child: ListView.builder(
            itemCount: widget.articles.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.detailsArticle,
                          arguments: widget.articles[index]);
                    },
                    child: CustomArticleItem(article: widget.articles[index])),
              );
            }),
      ),
    );
    ;
  }
}
