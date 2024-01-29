import 'package:belajar_riverpod/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:belajar_riverpod/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:belajar_riverpod/features/authentication/domain/repositories/auth_repository.dart';
import 'package:belajar_riverpod/features/home/data/datasource/home_remote_data_source.dart';
import 'package:belajar_riverpod/features/home/data/repositories/home_repository_impl.dart';
import 'package:belajar_riverpod/features/home/domain/repositories/home_repository.dart';
import 'package:belajar_riverpod/shared/data/remote/remote.dart';
import 'package:belajar_riverpod/shared/domain/providers/dio_network_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeDataSourceProvider =
    Provider.family<HomeDataSource, NetworkService>(
  (_, networkService) => HomeRemoteDataSource(networkService),
);

final authRepositoryProvider = Provider<HomeRepository>(
  (ref) {
    final NetworkService networkService = ref.watch(networkServiceProvider);
    final HomeDataSource dataSource =
        ref.watch(homeDataSourceProvider(networkService));

    return HomeRepositoryImpl(dataSource);
  },
);
