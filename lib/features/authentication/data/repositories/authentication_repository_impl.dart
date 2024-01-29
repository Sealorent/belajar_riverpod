import 'package:belajar_riverpod/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:belajar_riverpod/features/authentication/domain/repositories/auth_repository.dart';
import 'package:belajar_riverpod/shared/domain/models/either.dart';
import 'package:belajar_riverpod/shared/domain/models/login/login_model.dart';
import 'package:belajar_riverpod/shared/domain/models/login/login_response_model.dart';
import 'package:belajar_riverpod/shared/domain/models/parse_response.dart';
import 'package:belajar_riverpod/shared/domain/models/register/register_model.dart';
import 'package:belajar_riverpod/shared/exceptions/http_exception.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final LoginUserDataSource dataSource;

  AuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, LoginResponseModel>> loginUser({required LoginModel login}) {
    return dataSource.loginUser(login: login);
  }

  @override
  Future<Either<AppException, ParseResponse>> registerUser({required RegisterModel register}) {
    return dataSource.registerUser(register: register);
  }


}
