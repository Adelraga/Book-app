import 'package:bloc/bloc.dart';
import 'package:bookly/Features/search/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/book/book.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSearchBooks({required String booksType}) async {
    emit(SearchLoading());
    var result = await homeRepo.fetchSearchBooks(booksType: booksType);
    result.fold((failure) => {emit(SearchFailure(failure.errMessage))},
        (books) => {emit(SearchSuccess(books))});
  }
}
