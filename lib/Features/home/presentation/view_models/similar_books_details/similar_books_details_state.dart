part of 'similar_books_details_cubit.dart';

sealed class SimilarBooksDetailsState extends Equatable {
  const SimilarBooksDetailsState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksDetailsInitial extends SimilarBooksDetailsState {}
final class SimilarBooksDetailsLoading extends SimilarBooksDetailsState {}
final class SimilarBooksDetailsSuccess extends SimilarBooksDetailsState {
  final List<Book> books;

  const SimilarBooksDetailsSuccess(this.books);
}
final class SimilarBooksDetailsFailure extends SimilarBooksDetailsState {
  final String errMessage;

  const SimilarBooksDetailsFailure(this.errMessage);
}