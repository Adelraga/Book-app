import 'package:bookly/core/utils/book/book.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Book>>> fetchSearchBooks(
      {required String booksType});
}
