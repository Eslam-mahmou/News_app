import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/Models/CategoriesModel.dart';

import 'CustomCategoryItem.dart';

class HomeViewBody extends StatelessWidget {
   HomeViewBody({super.key,required this.onTap});
   Function onTap;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var localization = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.pick_your_category_of_interest,
            style: theme.textTheme.bodyLarge,
          ),
         const SizedBox(
            height: 16,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                ),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      onTap(CategoriesModel.getCategory(context)[index]);
                    },
                    child: CustomCategoryItem(
                      categoriesModel:CategoriesModel.getCategory(context)[index] ,
                      index: index,
                    ),
                  );
                },
            itemCount: CategoriesModel.getCategory(context).length,),
          )
        ],
      ),
    );
  }
}
