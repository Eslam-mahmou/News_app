import 'package:flutter/material.dart';
import 'package:news_app/Core/Utils/AppAssets.dart';
import 'package:news_app/Models/CategoriesModel.dart';

class CustomCategoryItem extends StatelessWidget {
   CustomCategoryItem({super.key,required this.categoriesModel,required this.index});
CategoriesModel categoriesModel;
int index;
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: categoriesModel.color,
        borderRadius: BorderRadius.only(
           topRight:const Radius.circular(25),
          topLeft:const Radius.circular(25),
          bottomRight: Radius.circular(
            index %2==0?0:20
        ),
          bottomLeft: Radius.circular(
              index %2!=0?0:20
          )
        )
      ),
      child: Column(
        children: [
          Image.asset( categoriesModel.image,
          height:  MediaQuery.of(context).size.height *.14,),
          Text(categoriesModel.name,
          style:theme.textTheme.displayLarge ,),
        ],
      ),
    );
  }
}
