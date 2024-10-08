import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/domain/entities/sign_up_entity.dart';

abstract class SignUpRepo {
  Future<Either<Failure,SignUpEntity>>postNewUser ({required SignUpParams params});
}