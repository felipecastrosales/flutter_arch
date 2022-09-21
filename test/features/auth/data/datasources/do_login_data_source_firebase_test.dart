import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_arch/features/auth/data/datasources/do_login_data_source_firebase.dart';

void main() {
  var dataSource = DoLoginDataSourceFirebase();

  test('Should get error when try do login with api', () async {
    expect(
      () async => await dataSource.doLogin(
        email: 'soufeliposales@gmail.com',
        password: '1234567',
      ),
      throwsA(
        isA<UnimplementedError>(),
      ),
    );
  });
}
