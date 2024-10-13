import 'package:bloc/bloc.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/core/database/cache/cache_helper.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/data/dataSource/remoteUpdateUser/remote_update_user_impl.dart';
import 'package:e_commrece/features/home/data/models/update_user_model.dart';
import 'package:e_commrece/features/home/data/repository/update_user_repo_impl.dart';
import 'package:e_commrece/features/home/domain/useCases/update_user_use_case.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/get_user_model.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit() : super(UpdateUserInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController mobilController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController renewPasswordController = TextEditingController();

  updateUser() async {
    emit(UpdateUserLoading());
    var response = await UpdateUserUseCase(
            updateUserRepo: UpdateUserRepoImpl(
                remoteUpdateUser:
                    RemoteUpdateUserImpl(api: DioConsumer(dio: Dio()))))
        .callUpdateUser(UpdateUserParams(
      name: nameController.text,
      email: emailController.text,
      phone: mobilController.text,
    ));

    response.fold((failure) {
      emit(UpdateUserFailure(failure.message));
      getUser();
    }, (result) {
      emit(UpdateUserSuccessful(result));
      getUser();
    });
  }

  changePassword() async {
    emit(ChangePasswordLoading());
    var response = await UpdateUserUseCase(
            updateUserRepo: UpdateUserRepoImpl(
                remoteUpdateUser:
                    RemoteUpdateUserImpl(api: DioConsumer(dio: Dio()))))
        .callChangePassword(ChangePasswordParams(
            currentPassword: currentPasswordController.text,
            password: newPasswordController.text,
            rePassword: renewPasswordController.text));

    response.fold((failure) {
      getUser();
      emit(ChangePasswordFailure(failure.message));
    }, (result) {
      getUser();
      emit(ChangePasswordSuccessful(result));
    });
  }

  getUser() async {
    var id = JWT.decode(CacheHelper.getData(key: "token"));
    emit(GetUserLoading());
    var response = await UpdateUserUseCase(
            updateUserRepo: UpdateUserRepoImpl(
                remoteUpdateUser:
                    RemoteUpdateUserImpl(api: DioConsumer(dio: Dio()))))
        .callGetUser(UpdateUserParams(id: id.payload["id"]));
    response.fold((failure) => emit(GetUserFailure(failure.message)), (result) {
      nameController.text = result.data?.name ?? "";
      emailController.text = result.data?.email ?? "";
      mobilController.text = result.data?.phone ?? "";
      emit(GetUserSuccessful(result));
    });
  }
}
