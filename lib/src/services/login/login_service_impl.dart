import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/local_storage_keys.dart';
import '../../core/exceptions/auth_exception.dart';
import '../../core/exceptions/service_exception.dart';
import '../../core/funcional_program/either.dart';
import '../../core/funcional_program/nil.dart';
import '../../repositories/user/user_repository.dart';

import './login_service.dart';

final class LoginServiceImpl implements LoginService {
  final UserRepository userRepository;

  const LoginServiceImpl({required this.userRepository});

  @override
  Future<Either<ServiceException, Nil>> execute(
    String email,
    String password,
  ) async {
    final response = await userRepository.login(
      email: email,
      password: password,
    );
    switch (response) {
      case Success(value: final accessToken):
        final preferences = await SharedPreferences.getInstance();
        preferences.setString(LocalStorageKeys.accessToken, accessToken);
        return Success(nil);
      case Failure(:final exception):
        return switch (exception) {
          AuthError() => Failure(ServiceException(message: exception.message)),
          UnauthorizedAuthException() =>
            Failure(ServiceException(message: exception.message)),
        };
    }
  }
}
