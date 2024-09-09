import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/features/auth/data/models/sign_in_model.dart';
import '../../../../../core/params/params.dart';

abstract class RemoteSignIn {
  Future <Either<ErrorModel,SignInModel>> postUser ({required SignInParams params});
}