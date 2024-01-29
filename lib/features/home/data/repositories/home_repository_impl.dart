import 'package:belajar_riverpod/features/home/data/datasource/home_remote_data_source.dart';
import 'package:belajar_riverpod/features/home/domain/repositories/home_repository.dart';
import 'package:belajar_riverpod/shared/domain/models/either.dart';
import 'package:belajar_riverpod/shared/domain/models/login/login_model.dart';
import 'package:belajar_riverpod/shared/exceptions/http_exception.dart';

class HomeRepositoryImpl extends HomeRepository {

  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, Object>> home({required LoginModel login}) {
    return dataSource.home(login: login);
  }




}
