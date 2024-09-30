

import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/api_consumer.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataVerifyCode/remote_verify_code.dart';
import 'package:e_commrece/features/auth/domain/repositery/verify_code_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/dataSoures/remoteDataSignIn/remote_sign_in.dart';
import '../../features/auth/data/dataSoures/remoteDataSignIn/remote_sign_in_impl.dart';
import '../../features/auth/data/dataSoures/remoteDataSignUp/remote_sign_up.dart';
import '../../features/auth/data/dataSoures/remoteDataSignUp/remote_sign_up_impl.dart';
import '../../features/auth/data/dataSoures/remoteDataVerifyCode/remote_verify_code_impl.dart';
import '../../features/auth/data/repositery/sign_in_repo_impl.dart';
import '../../features/auth/data/repositery/sign_up_repo_impl.dart';
import '../../features/auth/data/repositery/verify_code_repo_impl.dart';
import '../../features/auth/domain/repositery/sign_up_repo.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<RemoteSignInImpl>(RemoteSignInImpl(api: getIt.get<DioConsumer>()));
  getIt.registerSingleton<SignInRepoImpl>(SignInRepoImpl(remoteSignIn: getIt.get<RemoteSignIn>()));
  getIt.registerSingleton<RemoteSignUp>(RemoteSignUpImpl(api: getIt.get<ApiConsumer>()));
  getIt.registerSingleton<SignUpRepo>(SignUpRepoImpl(remoteSignUp: getIt.get<RemoteSignUp>()));
  getIt.registerSingleton<RemoteVerifyCode>(RemoteVerifyCodeImpl(api: getIt.get<ApiConsumer>()));
  getIt.registerSingleton<VerifyCodeRepo>(VerifyCodeRepoImpl(remoteVerifyCode: getIt.get<RemoteVerifyCode>()));

}