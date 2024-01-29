import 'package:belajar_riverpod/shared/domain/models/either.dart';
import 'package:belajar_riverpod/shared/domain/models/login/login_model.dart';
import 'package:belajar_riverpod/shared/domain/models/login/login_response_model.dart';
import 'package:belajar_riverpod/shared/domain/models/parse_response.dart';
import 'package:belajar_riverpod/shared/domain/models/register/register_model.dart';
import 'package:belajar_riverpod/shared/exceptions/http_exception.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, LoginResponseModel>> loginUser({required LoginModel login});
  Future<Either<AppException, ParseResponse>> registerUser({required RegisterModel register});
}
