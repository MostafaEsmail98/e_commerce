import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/features/auth/domain/entities/sign_in_entity.dart';

import '../../../../core/params/params.dart';

abstract class SignInRepo {
 Future <Either<ErrorModel,SignInEntity>> postUser ({required SignInParams params});
}