import 'package:belajar_riverpod/shared/domain/models/either.dart';
import 'package:belajar_riverpod/shared/domain/models/login/login_response_model.dart';
import 'package:belajar_riverpod/shared/exceptions/http_exception.dart';

abstract class UserRepository {
  Future<Either<AppException, LoginResponseModel>> fetchUser();
  Future<bool> saveUser({required LoginResponseModel user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}
