import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/book/book.dart';
import '../../../data/repos/home_repo.dart';

part 'similar_books_details_state.dart';

class SimilarBooksDetailsCubit extends Cubit<SimilarBooksDetailsState> {
  SimilarBooksDetailsCubit(this.homeRepo) : super(SimilarBooksDetailsInitial());
   final HomeRepo homeRepo;

  Future<void> fetchSimilarBooksDetails({required String category}) async {
    emit(SimilarBooksDetailsLoading());
    var result = await homeRepo.fetchSimilarBooksDetails(category: category);
    result.fold((failure) => {emit(SimilarBooksDetailsFailure(failure.errMessage))},
        (books) => {emit(SimilarBooksDetailsSuccess(books))});
  }
}
