import 'package:belajar_riverpod/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:belajar_riverpod/shared/domain/models/login/login_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentUserProvider = FutureProvider<LoginResponseModel?>((ref) async {
  final repository = ref.watch(userLocalRepositoryProvider);
  final eitherType = (await repository.fetchUser());

  return eitherType.fold((l) => null, (r) => r);
});
