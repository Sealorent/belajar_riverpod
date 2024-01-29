// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  
  final String token;
  final String email;
  final String name;
  final String nip;
  final String imgUrl;

  const LoginResponseModel({
      this.token = '',
      this.email = '',
      this.name = '',
      this.nip = '',
      this.imgUrl = '',
  });
  

  @override
  List<Object> get props {
    return [
      token,
      email,
      name,
      nip,
      imgUrl,
    ];
  }

  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'email': email,
      'name': name,
      'nip': nip,
      'imgUrl': imgUrl,
    };
  }

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token']  ?? '',
      email: json['email']   ?? '',
      name: json['name']  ?? '', 
      nip: json['nip'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
    );
  }


  LoginResponseModel copyWith({
    String? token,
    String? email,
    String? name,
    String? nip,
    String? imgUrl,
  }) {
    return LoginResponseModel(
      token: token ?? this.token,
      email: email ?? this.email,
      name: name ?? this.name,
      nip: nip ?? this.nip,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }
}
