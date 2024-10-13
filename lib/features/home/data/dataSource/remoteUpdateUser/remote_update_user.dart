import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/models/update_user_model.dart';

import '../../models/get_user_model.dart';

abstract class RemoteUpdateUser {
  Future<Either<Failure,UpdateUserModel>>  updateUser(UpdateUserParams params);
  Future<Either<Failure,GetUserModel>>  getUser(UpdateUserParams params);
  Future<Either<Failure,String>>  changePassword(ChangePasswordParams params);
}