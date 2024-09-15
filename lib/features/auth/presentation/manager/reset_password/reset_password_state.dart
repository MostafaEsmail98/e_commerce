part of 'reset_password_cubit.dart';
class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}
final class ResetPasswordFailure extends ResetPasswordState {
  ErrorModel errorModel ;

  ResetPasswordFailure({required this.errorModel});
}
final class ResetPasswordSuccessful extends ResetPasswordState {
  ResetPasswordEntity resetPasswordEntity ;

  ResetPasswordSuccessful({required this.resetPasswordEntity});
}
final class ResetPasswordLoading extends ResetPasswordState {}
