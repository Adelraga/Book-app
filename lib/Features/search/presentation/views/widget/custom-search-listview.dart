import 'package:bookly/Features/home/presentation/views/widgets/BestSellerListViewItem.dart';
import 'package:bookly/Features/search/presentation/views/widget/searchitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/customLoadingIndicaor.dart';
import '../../../../../core/widgets/errorMessage.dart';
import '../../view_model/cubit/search_cubit.dart';

class CustomSearchListView extends StatelessWidget {
  const CustomSearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if(state is SearchSuccess)
        {
        return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                 child: searchListViewItem(bookModel: state.books[index],
                imageUrl:state.books[index].volumeInfo.imageLinks?.thumbnail ?? '' , 
                ),
              );
            });
        }
          if(state is SearchFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        else {
        return const CustomLoadingWidget();
      }
      },
    );
  }
}
