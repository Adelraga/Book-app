import 'package:bookly/Features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/customLoadingIndicaor.dart';
import '../../../../../core/widgets/errorMessage.dart';
import 'BestSellerListViewItem.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
      if (state is NewestBooksSuccess) {
        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return  Padding(
                padding: EdgeInsets.symmetric(vertical: 10),

                child: BestSellerListViewItem(bookModel: state.books[index],
                imageUrl:state.books[index].volumeInfo.imageLinks?.thumbnail ?? '' , 
                ),
              );
            });
      } else if (state is NewestBooksFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const CustomLoadingWidget();
      }
    });
  }
}
