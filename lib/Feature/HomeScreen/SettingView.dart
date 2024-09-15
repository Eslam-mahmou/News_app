import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../Core/Services/AppProvider.dart';
import '../../Core/Utils/AppAssets.dart';
import '../../Core/Utils/AppColors.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    var localizations=AppLocalizations.of(context)!;
    var height=MediaQuery.of(context).size.height;
    List<String>_languages=[localizations.english,localizations.arabic];
    var provider=Provider.of<AppProvider>(context);
    return Container(
        decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        image: DecorationImage(
        image: AssetImage(AppAssets.backgroundImage),
    fit: BoxFit.cover,
    )),
    child:Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height *.04,
        ),
        Text(
          localizations.language,
          style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 18,
          color: AppColors.blackColor),
        ),
        SizedBox(
          height: height * .02,
        ),
        CustomDropdown<String>(
            hintText: "Select your language",

            decoration: CustomDropdownDecoration(
              closedBorder:Border.all(
                color: AppColors.primaryColor,
                width: 2
              ),
              closedFillColor:AppColors.whiteColor,
              expandedFillColor:AppColors.whiteColor,
              closedSuffixIcon:const Icon(
                Icons.keyboard_arrow_down,
                color:AppColors.primaryColor,
              ),
              headerStyle: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 18,
                  color: AppColors.primaryColor
              ),
              listItemStyle:theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: AppColors.blackColor
              ),
            ),
            items: _languages,
            initialItem: provider.locale ==const Locale("en")
                ? _languages[0]
                : _languages[1],
            onChanged: (value) {
              if (value == _languages[0]) {
                provider.changeLanguage("en");
              }
              else {
                provider.changeLanguage("ar");
              }
            }),
      ],
      ),
    ));
  }
}

