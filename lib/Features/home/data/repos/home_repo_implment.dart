import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/book/book.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Book>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject:computer science&Sorting=newest');

      List<Book> books = [];

      for (var item in data['items']) {
        books.add(Book.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');

      List<Book> books = [];

      for (var item in data['items']) {
        books.add(Book.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<Book>>> fetchSimilarBooksDetails({required String category}) async {
          try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:computer science&Sorting=relevance');

      List<Book> books = [];

      for (var item in data['items']) {
        books.add(Book.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
