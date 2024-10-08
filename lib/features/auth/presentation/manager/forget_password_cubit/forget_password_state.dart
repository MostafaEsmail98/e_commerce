part of 'forget_password_cubit.dart';

class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccessful extends ForgetPasswordState {
  ForgetPasswordEntity passwordEntity;

  ForgetPasswordSuccessful(this.passwordEntity);
}

final class ForgetPasswordFailure extends ForgetPasswordState {
  String errorModel;

  ForgetPasswordFailure(this.errorModel);
}
