import 'package:flutter/material.dart';
import 'package:news_app/Core/Utils/AppColors.dart';
import '../../../Models/source_model.dart';

class CustomSourceItem extends StatelessWidget {
  CustomSourceItem({super.key,required this.source,required this.isSelected});
final Source source;
bool isSelected;
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
      decoration: BoxDecoration(
        color:isSelected ? AppColors.primaryColor :AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryColor),
      ),child: Text(source.name!,
          style:theme.textTheme.displayLarge?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color:isSelected? AppColors.whiteColor :AppColors.primaryColor
      ),
    ));
  }
}
