import 'package:dartz/dartz.dart';
import 'package:e_commrece/core/errors/exceptions.dart';
import 'package:e_commrece/features/auth/domain/entities/sign_in_entity.dart';

import '../../../../core/params/params.dart';

abstract class SignInRepo {
 Future <Either<Failure,SignInEntity>> postUser ({required SignInParams params});
}