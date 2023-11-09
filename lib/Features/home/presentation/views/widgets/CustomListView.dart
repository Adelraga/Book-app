import 'package:bookly/Features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/CustomListViewItem.dart';
import 'package:bookly/core/utils/customLoadingIndicaor.dart';
import 'package:bookly/core/widgets/errorMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    var nextPage = 1;
    var isLoading = false;
    // Add this listener to trigger the fetchFeaturedBooks request
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
          0.7 * scrollController.position.maxScrollExtent) {
        // Trigger the fetchFeaturedBooks request here
        if (!isLoading) {
          isLoading = true;
          await BlocProvider.of<FeaturedBooksCubit>(context)
              .fetchFeaturedBooks(pageNumber: nextPage);
          nextPage++;
          isLoading = false;
        }
      }
    });

    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              controller: scrollController,
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
                  child: CustomListViewItem(imageUrl: imageUrl),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
