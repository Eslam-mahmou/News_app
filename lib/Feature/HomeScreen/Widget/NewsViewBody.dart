import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Utils/AppColors.dart';
import 'package:news_app/Feature/HomeScreen/Manage/SourceCubit/SourceCubit.dart';
import 'package:news_app/Feature/HomeScreen/Manage/SourceCubit/SourceState.dart';
import 'package:news_app/Feature/HomeScreen/Widget/CategoryViewDetails.dart';
import 'package:news_app/Models/CategoriesModel.dart';
import 'package:news_app/Injectable/di.dart';
class NewsViewBody extends StatefulWidget {
  NewsViewBody({super.key, required this.categoriesModel});

  CategoriesModel categoriesModel;

  @override
  State<NewsViewBody> createState() => _NewsViewBodyState();
}

class _NewsViewBodyState extends State<NewsViewBody> {
  SourceCubit viewModel=getIt<SourceCubit>();
  @override
  void initState() {
    viewModel.getSources(widget.categoriesModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getSources(widget.categoriesModel.id),
      child: BlocBuilder<SourceCubit, SourceState>(
        builder: (context, state) {
          if (state is LoadingSourceState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
         else if (state is FailureSourceState) {
            return Column(
              children: [
                Text(state.errorMessage),
                TextButton(
                    onPressed: () {
                      viewModel.getSources(widget.categoriesModel.id);
                    },
                    child: const Text("Try again"))
              ],
            );
          }
        else  if (state is SuccessSourceState) {
            return CategoryViewDetails(sourcesList: state.sourceList);
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
    // return FutureBuilder<List<Source>>(
    //     future: ApiManager.fetchSources(widget.categoriesModel.id),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return Column(
    //           children: [
    //             const Text('Error fetching Sources}'),
    //             TextButton(onPressed: () {
    //              setState(() {
    //                ApiManager.fetchSources(widget.categoriesModel.id);
    //              });
    //             }, child: const Text("Try again"))
    //           ],
    //         );
    //       }
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //             child: CircularProgressIndicator(
    //           color: AppColors.primaryColor,
    //         ));
    //       }
    //       List<Source> sourceList = snapshot.data ?? [];
    //       return CategoryViewDetails(sourcesList: sourceList);
    //     });
  }
}
