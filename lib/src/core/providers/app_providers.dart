import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../rest_client/rest_client.dart';

part 'app_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();
