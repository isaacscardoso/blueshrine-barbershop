import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/auth_exception.dart';
import '../../core/funcional_program/either.dart';
import '../../core/rest_client/rest_client.dart';

import './user_repository.dart';

final class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;

  const UserRepositoryImpl({required this.restClient});

  @override
  Future<Either<AuthException, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final Response(:data) = await restClient.unAuth.post('/auth', data: {
        'email': email,
        'password': password,
        // ignore: require_trailing_commas
      });
      return Success(data['access_token']);
    } on DioException catch (e, s) {
      if (e.response?.statusCode == 403) {
        log('Invalid e-mail or password.', error: e, stackTrace: s);
        return Failure(
          const UnauthorizedAuthException(
            message: 'Invalid e-mail or password.',
          ),
        );
      }
      log('An error occurred while trying to log in.', error: e, stackTrace: s);
      return Failure(
        const AuthError(message: 'An error occurred while trying to log in.'),
      );
    }
  }
}
