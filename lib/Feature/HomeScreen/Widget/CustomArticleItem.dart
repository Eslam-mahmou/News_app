import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Core/Utils/AppColors.dart';
import '../../../Models/articles_model.dart';
class CustomArticleItem extends StatelessWidget {
  const CustomArticleItem({super.key,required this.article});
final Article article;
  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .25,
          child: CachedNetworkImage(
            imageUrl: article.urlToImage,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter:const ColorFilter.mode(
                        Colors.red, BlendMode.colorBurn)),
              ),
            ),
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          ),
        ),
       const SizedBox(
          height: 8,
        ),
        Text(
        "${article.author}*",
          textAlign: TextAlign.start,
          style: theme.textTheme.bodyLarge
              ?.copyWith(fontSize: 12, fontWeight: FontWeight.normal),

        ),
        Text(article.title,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,

            )),
        Text("${DateFormat("h").format(DateTime.parse(article.publishedAt))} years ago",
        textAlign: TextAlign.end,
        style: theme.textTheme.labelMedium,)
      ],
    );
  }
}
