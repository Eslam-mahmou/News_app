import 'package:flutter/material.dart';
import 'package:news_app/Core/Utils/AppAssets.dart';
import 'package:news_app/Core/Utils/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/Feature/HomeScreen/SettingView.dart';
import 'package:news_app/Feature/HomeScreen/Widget/HomeViewBody.dart';
import 'package:news_app/Feature/HomeScreen/Widget/NewsViewBody.dart';
import 'package:news_app/Models/CategoriesModel.dart';
import 'Widget/CustomDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var localizations = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundImage),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectedDrawerTab ==CustomDrawer.settings?
                localizations.setting
                :
              selectedCategory == null
                  ? localizations.news
                  : selectedCategory!.name,
              style: theme.textTheme.displayLarge),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          actions: [
            if (selectedCategory != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 35,
                    )),
              )
          ],
          backgroundColor: AppColors.primaryColor,
        ),
        drawer:  CustomDrawer(onClicked:onClickedDrawerTab,),
        body: selectedDrawerTab==CustomDrawer.settings?
           const SettingView():
        selectedCategory == null
            ?  HomeViewBody(
          onTap: onClicked,
        ):NewsViewBody(categoriesModel: selectedCategory!)

      ),
    );
  }

  CategoriesModel? selectedCategory;

  void onClicked(newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }
  int selectedDrawerTab=CustomDrawer.categories;
  void onClickedDrawerTab(int newClickedTab){
    selectedDrawerTab=newClickedTab ;
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
