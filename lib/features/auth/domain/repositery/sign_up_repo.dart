import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/entities/sign_up_entity.dart';

abstract class SignUpRepo {
  Future<Either<ErrorModel,SignUpEntity>>postNewUser ({required SignUpParams params});
}