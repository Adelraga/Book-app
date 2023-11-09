import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/book/book.dart';



part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks({int pageNumber=0}) async {
    emit(FeaturedBooksLoading());
      var result = await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
      result.fold(
          (failure) => {emit(FeaturedBooksFailure(failure.errMessage))},
          (books) => {emit(FeaturedBooksSuccess(books))});
    
  }
}
