import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/book/book.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Book>>> fetchNewsetBooks();
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks();
  Future<Either<Failure, List<Book>>> fetchSimilarBooksDetails({required String category});
}
