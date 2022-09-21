import 'package:dartz/dartz.dart';
import 'package:flutter_arch/core/error/failure.dart';
// import 'package:flutter_arch/features/auth/data/datasources/do_login_data_source_api.dart';
import 'package:flutter_arch/features/auth/domain/entities/user.dart';

abstract class DoLoginRepository {
  // DoLoginRepository(DoLoginDataSourceApi doLoginDataSourceApi);

  Future<Either<Failure, User>> doLogin({
    required String email,
    required String password,
  });
}
