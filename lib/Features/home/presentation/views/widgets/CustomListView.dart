import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/customLoadingIndicaor.dart';
import '../../../../../core/widgets/errorMessage.dart';
import '../../view_models/featured_books_cubit/featured_books_cubit.dart';
import 'CustomListViewItem.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final imageUrl =
                    state.books[index].volumeInfo.imageLinks.thumbnail ?? '';
                // Use imageUrl safely and handle null case if necessary
                return GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push('/bookDetail', extra: state.books[index]);
                    },
                    child: CustomListViewItem(imageUrl: imageUrl));
              }),
        );
      } else if (state is FeaturedBooksFailure) {
        return CustomErrorWidget(
          errMessage: state.errMessage,
        );
      } else {
        return const CustomLoadingWidget();
      }
    });
  }
}
