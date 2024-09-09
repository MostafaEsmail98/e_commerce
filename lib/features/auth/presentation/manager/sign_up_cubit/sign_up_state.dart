part of 'sign_up_cubit.dart';

class SignUpState {}

final class SignUpInitial extends SignUpState {}
final class SignUpLoading extends SignUpState {}
final class SignUpSuccessful extends SignUpState {
  SignUpEntity signInEntity;

  SignUpSuccessful(this.signInEntity);
}
final class SignUpFailure extends SignUpState {
  ErrorModel failure;
  SignUpFailure(this.failure);
}
