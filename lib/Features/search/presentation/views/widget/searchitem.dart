import 'package:bookly/core/utils/book/book.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/BookRating.dart';
import '../../../../home/presentation/views/widgets/CustomListViewItem.dart';


class searchListViewItem extends StatelessWidget {
  const searchListViewItem(
      {super.key, required this.bookModel, required this.imageUrl});
  final Book bookModel;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/bookDetail',extra: bookModel);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            CustomListViewItem(imageUrl: imageUrl),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(bookModel.volumeInfo.title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: KGtSectraFine)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    bookModel.volumeInfo.authors![0] ,
                    overflow: TextOverflow.ellipsis, 
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      BookRating(rating: bookModel.volumeInfo.averageRating??0, count: bookModel.volumeInfo.ratingsCount ??0)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
