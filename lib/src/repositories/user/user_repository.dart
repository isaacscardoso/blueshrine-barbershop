import '../../core/exceptions/auth_exception.dart';
import '../../core/funcional_program/either.dart';

abstract interface class UserRepository {
  Future<Either<AuthException, String>> login({
    required String email,
    required String password,
  });
}
