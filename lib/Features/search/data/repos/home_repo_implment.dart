import 'package:bookly/core/utils/book/book.dart';
import 'package:bookly/Features/search/data/repos/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;

  HomeRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<Book>>> fetchSearchBooks(
      {required String booksType}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject:$booksType&Sorting=newest');

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
