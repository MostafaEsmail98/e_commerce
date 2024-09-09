import 'package:e_commrece/core/errors/error_model.dart';
import 'package:e_commrece/features/auth/domain/entities/sign_in_entity.dart';

class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccessful extends SignInState {
  SignInEntity signInEntity;

  SignInSuccessful(this.signInEntity);
}

final class SignInFailure extends SignInState {
  ErrorModel failure;

  SignInFailure(this.failure);
}
