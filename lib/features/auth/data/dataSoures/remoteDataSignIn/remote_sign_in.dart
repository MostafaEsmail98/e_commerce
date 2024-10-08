import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/features/auth/data/models/sign_in_model.dart';
import '../../../../../core/params/params.dart';

abstract class RemoteSignIn {
  Future <Either<Failure,SignInModel>> postUser ({required SignInParams params});
}