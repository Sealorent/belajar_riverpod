import 'package:equatable/equatable.dart';

class RegisterModel with EquatableMixin {
  String? name;
  String? email;
  String? password;

  RegisterModel({
    this.name,
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [name, email, password];

  RegisterModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }
}
