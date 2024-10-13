import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteUpdateUser/remote_update_user.dart';
import 'package:e_commrece/features/home/data/models/get_user_model.dart';
import 'package:e_commrece/features/home/data/models/update_user_model.dart';
import 'package:e_commrece/features/home/domain/repository/update_user_repo.dart';

class UpdateUserRepoImpl extends UpdateUserRepo{
  RemoteUpdateUser remoteUpdateUser ;

  UpdateUserRepoImpl({required this.remoteUpdateUser});

  @override
  Future<Either<Failure, UpdateUserModel>> updateUser(UpdateUserParams params) async{
   return await remoteUpdateUser.updateUser(params);
  }

  @override
  Future<Either<Failure, GetUserModel>> getUser(UpdateUserParams params) async{
    return await remoteUpdateUser.getUser(params);
  }

  @override
  Future<Either<Failure, String>> changePassword(ChangePasswordParams params)async {
    return await remoteUpdateUser.changePassword(params);
  }


}