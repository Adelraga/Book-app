import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);

      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure('badCertifi timeout with ApiServer');

      case DioExceptionType.connectionError:
        return ServerFailure('connectionError timeout with ApiServer');

      case DioExceptionType.cancel:
        return ServerFailure('cancel timeout with ApiServer');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('unknown error');
        }

      default:
        return ServerFailure(
            'unknown timeout with ApiServer'); // TODO: handle exception here!
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('method not found 404 error');
    } else {
      return ServerFailure('Oops , try again');
    }
  }
}
