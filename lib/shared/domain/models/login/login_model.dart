// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String email;
  final String password;
  final String fcmToken;

  const LoginModel({
    this.email = '',
    this.password = '',
    this.fcmToken = '',
  });  


  @override
  List<Object> get props => [email, password, fcmToken];

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'token_fcm': fcmToken,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] as String,
      password: map['password'] as String,
      fcmToken: map['token_fcm'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
