import 'dart:convert';

import 'package:flutter_arch/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.name,
    required super.bornDate,
    required super.pictureUrl,
    required super.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bornDate': bornDate.toIso8601String(),
      'pictureUrl': pictureUrl,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      bornDate: DateTime.parse(map['bornDate']),
      pictureUrl: map['pictureUrl'],
      email: map['email'],
    );
  }

  factory UserModel.fromFirebase(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      bornDate: DateTime.parse(map['bornDate']),
      pictureUrl: map['pictureUrl'],
      email: map['email'],
    );
  }

  @override
  List<Object?> get props => [name, bornDate, pictureUrl, email];

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
