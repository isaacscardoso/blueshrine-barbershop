import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repositories/user/user.dart';
import '../../services/login/login.dart';

import '../rest_client/rest_client.dart';

part 'app_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) =>
    UserRepositoryImpl(restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
LoginService loginService(LoginServiceRef ref) =>
    LoginServiceImpl(userRepository: ref.read(userRepositoryProvider));
