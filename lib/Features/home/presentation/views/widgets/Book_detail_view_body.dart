import 'package:bookly/Features/home/presentation/view_models/similar_books_details/similar_books_details_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/BookRating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/CustomListView.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/book/book.dart';
import '../../../../../core/utils/customLoadingIndicaor.dart';
import '../../../../../core/widgets/CustomButton.dart';
import '../../../../../core/widgets/errorMessage.dart';

import 'BooksActionButton.dart';
import 'CustomBookDetailsAppBar.dart';
import 'CustomListViewItem.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final Book bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  CustomBookDetailsAppBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .2),
                    child: CustomListViewItem(
                      imageUrl: bookModel.volumeInfo.imageLinks.thumbnail ?? '',
                    ),
                  ),
                  const SizedBox(
                    height: 43,
                  ),
                  Text(
                    bookModel.volumeInfo.title!,
                    style: Styles.textStyle30,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      bookModel.volumeInfo.authors?[0] ?? '',
                      style: Styles.textStyle18.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  BookRating(
                    mainAxisAlignment: MainAxisAlignment.center,
                    rating: bookModel.volumeInfo.averageRating ?? 0,
                    count: bookModel.volumeInfo.ratingsCount ?? 0,
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  BooksActionButton(bookModel: bookModel,),
                  Expanded(
                    child: const SizedBox(
                      height: 50,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'You Can also like',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BookDetailListView()
                ],
              ),
            ))
      ],
    );
  }
}

class BookDetailListView extends StatelessWidget {
  const BookDetailListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksDetailsCubit, SimilarBooksDetailsState>(
      builder: (context, state) {
        if (state is SimilarBooksDetailsSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: CustomListViewItem(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks.thumbnail ??
                              '',
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksDetailsFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
