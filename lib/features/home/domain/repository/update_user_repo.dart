import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/features/home/data/models/update_user_model.dart';

import '../../../../core/params/params.dart';
import '../../data/models/get_user_model.dart';

abstract class UpdateUserRepo {
  Future<Either<Failure,UpdateUserModel>> updateUser(UpdateUserParams params);
  Future<Either<Failure,GetUserModel>> getUser(UpdateUserParams params);
  Future<Either<Failure,String>> changePassword(ChangePasswordParams params);
}