import 'package:flutter/material.dart';
import 'package:news_app/Core/Utils/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustomDrawer extends StatelessWidget {
   CustomDrawer({required this.onClicked});
   Function onClicked;
  static const int categories=1;
  static const int settings= 2;
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var localizations=AppLocalizations.of(context)!;
    var theme=Theme.of(context);
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      width: width * .85,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: height *.07,),
            width: width,
            height:height*.2 ,
            color: AppColors.primaryColor,
            child: Text("${localizations.news}!",
            textAlign: TextAlign.center,
            style:theme.textTheme.bodyLarge?.copyWith(
              fontSize: 28,
              color: AppColors.whiteColor
            ) ,),

          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 18),
            child: InkWell(
              onTap: (){
                onClicked(categories);
              },
              child: Row(
                children: [
               const   Icon(Icons.list,
                  size: 40,),
                 const SizedBox(
                    width: 12,
                  ),
                  Text(localizations.categories,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 24,
                    color: AppColors.blackColor
                  ),)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: (){
                onClicked(settings);
              },
              child: Row(
                children: [
                  const   Icon(Icons.settings,
                    size: 40,),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(localizations.setting,
                    style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 24,
                        color: AppColors.blackColor
                    ),)
                ],
              ),
            ),
          )
        ],
      )

    );
  }
}
