import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/features/home/data/models/update_user_model.dart';
import 'package:e_commrece/features/home/domain/repository/update_user_repo.dart';

import '../../../../core/params/params.dart';
import '../../data/models/get_user_model.dart';

class UpdateUserUseCase {
  UpdateUserRepo updateUserRepo ;

  UpdateUserUseCase({required this.updateUserRepo});

  Future<Either<Failure,UpdateUserModel>> callUpdateUser(UpdateUserParams params)async{
    return await updateUserRepo.updateUser(params);
  } Future<Either<Failure,GetUserModel>> callGetUser(UpdateUserParams params)async{
    return await updateUserRepo.getUser(params);
  } Future<Either<Failure,String>> callChangePassword(ChangePasswordParams params)async{
    return await updateUserRepo.changePassword(params);
  }
}