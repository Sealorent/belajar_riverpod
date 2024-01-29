import 'package:belajar_riverpod/shared/data/remote/remote.dart';
import 'package:belajar_riverpod/shared/domain/models/either.dart';
import 'package:belajar_riverpod/shared/domain/models/login/login_model.dart';
import 'package:belajar_riverpod/shared/domain/models/login/login_response_model.dart';
import 'package:belajar_riverpod/shared/domain/models/parse_response.dart';
import 'package:belajar_riverpod/shared/domain/models/register/register_model.dart';
import 'package:belajar_riverpod/shared/exceptions/http_exception.dart';

abstract class LoginUserDataSource {
  Future<Either<AppException, LoginResponseModel>> loginUser({required LoginModel login});
  Future<Either<AppException, ParseResponse>> registerUser({required RegisterModel register});
}

class LoginUserRemoteDataSource implements LoginUserDataSource {
  final NetworkService networkService;

  LoginUserRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, LoginResponseModel>> loginUser({required LoginModel login}) async {
    try {
      final eitherType = await networkService.post(
        '/auth/sign-in',
        data: login.toMap(),
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          final parseResponse = ParseResponse.fromMap(response.data);

          final user = LoginResponseModel.fromJson(parseResponse.message!);
          // update the token for requests
          
          networkService.updateHeader(
            {'Authorization': user.token},
          );

          return Right(user);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, ParseResponse>> registerUser({required RegisterModel register }) async {
    try {
      final eitherType = await networkService.post(
        '/auth/sign-up',
        data: register.toJson(),
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          final result = ParseResponse.fromMap(response.data);
          
          return Right(result);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }
}
