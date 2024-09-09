import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/models/sign_up_model.dart';

abstract class RemoteSignUp {
  Future <Either <ErrorModel,SignUpModel>>postNewUser ({required SignUpParams params});
}