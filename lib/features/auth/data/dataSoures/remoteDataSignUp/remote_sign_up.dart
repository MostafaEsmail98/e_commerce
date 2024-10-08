import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/auth/data/models/sign_up_model.dart';

abstract class RemoteSignUp {
  Future <Either <Failure,SignUpModel>>postNewUser ({required SignUpParams params});
}