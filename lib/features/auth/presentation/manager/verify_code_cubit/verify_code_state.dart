part of 'verify_code_cubit.dart';

class VerifyCodeState {}

final class VerifyCodeInitial extends VerifyCodeState {}
final class VerifyCodeFailure extends VerifyCodeState {
  ErrorModel errorModel ;

  VerifyCodeFailure(this.errorModel);
}
final class VerifyCodeSuccessful extends VerifyCodeState {
  VerifyCodeEntity verifyCodeEntity ;

  VerifyCodeSuccessful(this.verifyCodeEntity);
}
final class VerifyCodeLoading extends VerifyCodeState {}
