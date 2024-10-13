part of 'update_user_cubit.dart';

class UpdateUserState {}

final class UpdateUserInitial extends UpdateUserState {}

final class UpdateUserFailure extends UpdateUserState {
  String error;

  UpdateUserFailure(this.error);
}

final class UpdateUserLoading extends UpdateUserState {}

final class UpdateUserSuccessful extends UpdateUserState {
  UpdateUserModel updateUserModel;

  UpdateUserSuccessful(this.updateUserModel);
}

final class GetUserFailure extends UpdateUserState {
  String error;

  GetUserFailure(this.error);
}

final class GetUserLoading extends UpdateUserState {}

final class GetUserSuccessful extends UpdateUserState {
  GetUserModel getUserModel;

  GetUserSuccessful(this.getUserModel);
}

final class ChangePasswordFailure extends UpdateUserState {
  String error;

  ChangePasswordFailure(this.error);
}

final class ChangePasswordLoading extends UpdateUserState {}

final class ChangePasswordSuccessful extends UpdateUserState {
  String result;

  ChangePasswordSuccessful(this.result);
}
