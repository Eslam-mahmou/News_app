import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Core/Utils/AppAssets.dart';
import '../../Core/Utils/AppColors.dart';
import '../../Models/articles_model.dart';
import 'Widget/CustomDetailsViewBody.dart';

class DetailsArticleView extends StatelessWidget {
  const DetailsArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Article;
    var theme = Theme.of(context);
    var url = Uri.parse(arg.url);
    return Container(
        decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            image: DecorationImage(
              image: AssetImage(AppAssets.backgroundImage),
              fit: BoxFit.cover,
            )),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text(
              "News title",
              style: theme.textTheme.displayLarge,
            ),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
          ),
          body: CustomDetailsViewBody(
              publishedAt: arg.publishedAt,
              title: arg.title,
              description: arg.description,
              image: arg.urlToImage,
              author: arg.author,
          onPressed: ()async{
            if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
            }
          },),
        ));
  }
}
