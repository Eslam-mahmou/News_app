import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Core/Utils/AppColors.dart';

class CustomDetailsViewBody extends StatelessWidget {
   CustomDetailsViewBody(
      {super.key,
      required this.publishedAt,
      required this.title,
      required this.description,
      required this.image,
      required this.author,
      required this.onPressed});

  final String image, title, description, publishedAt, author;
   Function() onPressed;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .06,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .25,
          child: CachedNetworkImage(
            imageUrl: image,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        Colors.red, BlendMode.colorBurn)),
              ),
            ),
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "$author*",
            textAlign: TextAlign.start,
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontSize: 12, fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(title,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            "${DateFormat("h").format(DateTime.parse(publishedAt))} years ago",
            textAlign: TextAlign.end,
            style: theme.textTheme.labelMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            description,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.displayLarge?.copyWith(
                color: AppColors.grayColor,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "View Full Article",
              style: theme.textTheme.displayLarge?.copyWith(
                color: AppColors.grayColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
                onPressed:onPressed ,
                icon: const Icon(Icons.arrow_forward_ios_outlined)),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
