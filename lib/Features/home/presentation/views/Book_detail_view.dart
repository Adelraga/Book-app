import 'package:bookly/Features/home/presentation/view_models/similar_books_details/similar_books_details_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/Book_detail_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/book/book.dart';



class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final Book bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksDetailsCubit>(context).fetchSimilarBooksDetails(category:widget.bookModel.volumeInfo.categories![0] );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: BookDetailsViewBody(
        bookModel: widget.bookModel,
      )),
    );
  }
}
