import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Padding(
            padding:
                const EdgeInsets.only(left: 9, top: 0, right: 0, bottom: 0),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )),
      ),
    );
  }
}
