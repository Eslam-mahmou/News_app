import 'package:flutter/material.dart';
import 'package:news_app/Core/Utils/AppAssets.dart';
import 'package:news_app/Core/Utils/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CategoriesModel {
  String id;
  String name;
  String image;
  Color color;

  CategoriesModel(
      {required this.name,
      required this.id,
      required this.color,
      required this.image});

  //     science sports technology
 static List<CategoriesModel>  getCategory(BuildContext context) {
   var localization=AppLocalizations.of(context)!;
    List<CategoriesModel> categories = [
      CategoriesModel(
          name: localization.sport,
          id: "sports",
          color: AppColors.redColor,
          image: AppAssets.sportImage),
      CategoriesModel(
          name: localization.politics,
          id: "general",
          color: AppColors.blueColor,
          image: AppAssets.politicsImage),
      CategoriesModel(
          name:localization.health,
          id: "health",
          color: AppColors.purpleColor,
          image: AppAssets.healthImage),
      CategoriesModel(
          name:localization.business,
          id: "business",
          color: AppColors.brownColor,
          image: AppAssets.businessImage),
      CategoriesModel(
          name: localization.environment,
          id: "entertainment",
          color: AppColors.skyBlueColor,
          image: AppAssets.environmentImage),
      CategoriesModel(
          name: localization.science,
          id: "science",
          color: AppColors.yellowColor,
          image: AppAssets.scienceImage),
      CategoriesModel(
          name: localization.technology,
          id: "technology",
          color: Colors.green,
          image: AppAssets.politicsImage),
    ];
    return categories;
  }
}
