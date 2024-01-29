import 'dart:convert';

import 'package:belajar_riverpod/shared/data/local/storage_service.dart';
import 'package:belajar_riverpod/shared/domain/models/either.dart';
import 'package:belajar_riverpod/shared/domain/models/login/login_response_model.dart';
import 'package:belajar_riverpod/shared/exceptions/http_exception.dart';
import 'package:belajar_riverpod/shared/globals.dart';

abstract class UserDataSource {
  String get storageKey;

  Future<Either<AppException, LoginResponseModel>> fetchUser();
  Future<bool> saveUser({required LoginResponseModel user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}

class UserLocalDatasource extends UserDataSource {
  UserLocalDatasource(this.storageService);

  final StorageService storageService;

  @override
  String get storageKey => USER_LOCAL_STORAGE_KEY;

  @override
  Future<Either<AppException, LoginResponseModel>> fetchUser() async {
    final data = await storageService.get(storageKey);
    if (data == null) {
      return Left(
        AppException(
          identifier: 'UserLocalDatasource',
          statusCode: 404,
          message: 'User not found',
        ),
      );
    }
    final userJson = jsonDecode(data.toString());

    return Right(LoginResponseModel.fromJson(userJson));
  }

  @override
  Future<bool> saveUser({required LoginResponseModel user}) async {
    return await storageService.set(storageKey, jsonEncode(user.toMap()));
  }

  @override
  Future<bool> deleteUser() async {
    return await storageService.remove(storageKey);
  }

  @override
  Future<bool> hasUser() async {
    return await storageService.has(storageKey);
  }
}
