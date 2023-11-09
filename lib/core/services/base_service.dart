import 'package:cocktail_app/core/constants/strings.dart';
import 'package:cocktail_app/core/di.dart';
import 'package:cocktail_app/core/failures_successes/failures.dart';
import 'package:cocktail_app/core/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class BaseService {
  final Dio _dio = sl<Dio>();

  @protected
  static const baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/';

  Future<Either<Failure, Response>> _processRequest(Function request) async {
    try {
      final response = await request.call() as Response;
      return Right(response);
    } on DioException catch (dioError) {
      String errorMessage = dioError.message ?? 'unknown error';
      if (dioError.type == DioExceptionType.connectionTimeout) {
        errorMessage = Strings.noInternetConnection;
      }
      Logger.warning('$runtimeType ${dioError.runtimeType}', errorMessage);
      return Left(FetchFailure(message: errorMessage));
    } catch (exception) {
      Logger.warning(runtimeType, exception);
      return Left(FetchFailure(message: exception.toString()));
    }
  }

  @protected
  Future<Either<Failure, Response>> get(String url,
      [Map<String, dynamic>? queryParams]) async {
    return await _processRequest(
        () => _dio.get('$baseUrl/$url', queryParameters: queryParams));
  }

  @protected
  Future<Either<Failure, Response>> post(
      String url, Map<String, dynamic> queryParams) async {
    return await _processRequest(
        () => _dio.post('$baseUrl/$url', queryParameters: queryParams));
  }
}
