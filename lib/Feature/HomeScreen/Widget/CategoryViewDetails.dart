import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Services/AppProvider.dart';
import 'package:news_app/Data/ApiManager.dart';
import 'package:news_app/Feature/HomeScreen/Manage/ArticleCubit/ArticleCubit.dart';
import 'package:news_app/Feature/HomeScreen/Manage/ArticleCubit/ArticleState.dart';
import 'package:news_app/Feature/HomeScreen/Widget/CustomArticlesListView.dart';
import 'package:news_app/Feature/HomeScreen/Widget/CustomSourceItem.dart';
import 'package:news_app/Injectable/di.dart';
import 'package:provider/provider.dart';

import '../../../Core/Utils/AppColors.dart';
import '../../../Models/source_model.dart';

class CategoryViewDetails extends StatefulWidget {
  CategoryViewDetails({super.key, required this.sourcesList});

  List<Source> sourcesList;

  @override
  State<CategoryViewDetails> createState() => _CategoryViewDetailsState();
}

class _CategoryViewDetailsState extends State<CategoryViewDetails> {
  ArticleCubit viewModel=getIt<ArticleCubit>();
  @override
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Column(children: [
      DefaultTabController(
          length: widget.sourcesList.length,
          child: TabBar(
              onTap: (index) {
               ArticleCubit.get(context).selectedIndex=index;
              },
              padding: const EdgeInsets.symmetric(vertical: 16),
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              tabs: widget.sourcesList.map((source) {
                return CustomSourceItem(
                  source: source,
                  isSelected: viewModel.selectedIndex ==
                      widget.sourcesList.indexOf(source),
                );
              }).toList())),
      BlocProvider(
        create: (context) => viewModel
          ..fetchArticles(widget.sourcesList[viewModel.selectedIndex].id!,
              "${provider.locale}"),
        child: BlocBuilder<ArticleCubit, ArticleState>(
          builder: (context, state) {
            if (state is LoadingArticleState) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ));
            } else if (state is SuccessArticleState) {
              return CustomArticlesListView(articles: state.articlesList);
            }
            else if(state is ChangeIndexState){
              return CustomArticlesListView(articles: state.articlesList);
            }
            else if (state is FailureArticleState) {
              return Column(
                children: [
                  Text(state.errorMessage),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          ApiManager().fetchArticles(
                              widget.sourcesList[viewModel.selectedIndex].id!,
                              "${provider.locale}");
                        });
                      },
                      child: const Text("Try again"))
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      )
    ]);
  }
}
