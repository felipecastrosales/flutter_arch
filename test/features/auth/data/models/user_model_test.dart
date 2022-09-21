import 'package:flutter_arch/features/auth/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('should convert model to map', () {
    var model = UserModel(
      name: 'felipecastrosales',
      bornDate: DateTime(2003, 12, 26),
      pictureUrl: 'https://github.com/felipecastrosales.png',
      email: 'soufeliposales@gmail.com',
    );

    var map = model.toMap();

    expect(map, tkUserApi);
  });

  test('should convert model to json', () async {
    var model = UserModel(
      name: 'felipecastrosales',
      bornDate: DateTime(2003, 12, 26),
      pictureUrl: 'https://github.com/felipecastrosales.png',
      email: 'soufeliposales@gmail.com',
    );

    var data = await rootBundle.loadString('assets/mock/user.json');
    var userJson = model.toJson();
    var user = UserModel.fromJson(data);

    expect(user.toJson(), userJson);
  });

  test('should get user from json', () async {
    var model = UserModel(
      name: 'felipecastrosales',
      bornDate: DateTime(2003, 12, 26),
      pictureUrl: 'https://github.com/felipecastrosales.png',
      email: 'soufeliposales@gmail.com',
    );

    var data = await rootBundle.loadString('assets/mock/user.json');

    var userJson = UserModel.fromJson(data);

    expect(userJson, model);
  });

  test('should get user from map', () async {
    var model = UserModel(
      name: 'felipecastrosales',
      bornDate: DateTime(2003, 12, 26),
      pictureUrl: 'https://github.com/felipecastrosales.png',
      email: 'soufeliposales@gmail.com',
    );

    var userMap = UserModel.fromMap(tkUserApi);

    expect(userMap, model);
  });

  test('should get user from Firebase', () async {
    var model = UserModel(
      name: 'felipecastrosales',
      bornDate: DateTime(2003, 12, 26),
      pictureUrl: 'https://github.com/felipecastrosales.png',
      email: 'soufeliposales@gmail.com',
    );

    var userMap = UserModel.fromFirebase(tkUserApi);

    expect(userMap, model);
  });
}

var tkUserApi = {
  'name': 'felipecastrosales',
  'bornDate': DateTime(2003, 12, 26).toIso8601String(),
  'pictureUrl': 'https://github.com/felipecastrosales.png',
  'email': 'soufeliposales@gmail.com'
};
