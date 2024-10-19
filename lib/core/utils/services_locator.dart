import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/api/dio_consumer.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataForgetPassword/remote_forget_password_impl.dart';
import 'package:e_commrece/features/auth/data/dataSoures/remoteDataResetPassword/remote_reset_password_impl.dart';
import 'package:e_commrece/features/auth/data/repositery/reset_password_repo_impl.dart';
import 'package:e_commrece/features/auth/domain/usesCase/reset_password_use_cases.dart';
import 'package:e_commrece/features/auth/domain/usesCase/sign_in_uses_case.dart';
import 'package:e_commrece/features/auth/domain/usesCase/verify_code_use_cases.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/dataSoures/remoteDataSignIn/remote_sign_in_impl.dart';
import '../../features/auth/data/dataSoures/remoteDataSignUp/remote_sign_up_impl.dart';
import '../../features/auth/data/dataSoures/remoteDataVerifyCode/remote_verify_code_impl.dart';
import '../../features/auth/data/repositery/forget_password_repo_impl.dart';
import '../../features/auth/data/repositery/sign_in_repo_impl.dart';
import '../../features/auth/data/repositery/sign_up_repo_impl.dart';
import '../../features/auth/data/repositery/verify_code_repo_impl.dart';
import '../../features/auth/domain/usesCase/forget_password_use_cases.dart';
import '../../features/auth/domain/usesCase/sign_up_use_cases.dart';
import '../../features/home/data/dataSource/remoteAllCategories/remote_all_categories_impl.dart';
import '../../features/home/data/dataSource/remoteAllProduct/remote_all_product_impl.dart';
import '../../features/home/data/dataSource/remoteBrands/remote_brands_impl.dart';
import '../../features/home/data/dataSource/remoteCart/remote_cart_impl.dart';
import '../../features/home/data/dataSource/remoteCategoriesTab/remote_categories_tab_impl.dart';
import '../../features/home/data/dataSource/remoteGetWishlist/remote_get_wishlist_impl.dart';
import '../../features/home/data/dataSource/remoteSpecificProduct/remote_specific_product_impl.dart';
import '../../features/home/data/dataSource/remoteUpdateUser/remote_update_user_impl.dart';
import '../../features/home/data/repository/all_product_repo_impl.dart';
import '../../features/home/data/repository/brands_repo_impl.dart';
import '../../features/home/data/repository/cart_repo_impl.dart';
import '../../features/home/data/repository/categories_repo_impl.dart';
import '../../features/home/data/repository/categories_tab_repo_impl.dart';
import '../../features/home/data/repository/get_wishlist_repo_impl.dart';
import '../../features/home/data/repository/specific_product_repo_impl.dart';
import '../../features/home/data/repository/update_user_repo_impl.dart';
import '../../features/home/domain/useCases/all_product_use_case.dart';
import '../../features/home/domain/useCases/brands_use_case.dart';
import '../../features/home/domain/useCases/cart_use_case.dart';
import '../../features/home/domain/useCases/categories_tab_use_case.dart';
import '../../features/home/domain/useCases/categories_use_case.dart';
import '../../features/home/domain/useCases/get_wishlist_use_case.dart';
import '../../features/home/domain/useCases/specific_product_use_case.dart';
import '../../features/home/domain/useCases/update_user_use_case.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio:getIt.get<Dio>()));

  getIt.registerSingleton<RemoteSignInImpl>(RemoteSignInImpl(api: getIt.get<DioConsumer>()));
  getIt.registerSingleton<SignInRepoImpl>(SignInRepoImpl(remoteSignIn: getIt.get<RemoteSignInImpl>()));
  getIt.registerSingleton<SignInUsesCase>(SignInUsesCase(signInRepo: getIt.get<SignInRepoImpl>()));

  getIt.registerSingleton<RemoteSignUpImpl>(RemoteSignUpImpl(api: getIt.get<DioConsumer>()));
  getIt.registerSingleton<SignUpRepoImpl>(SignUpRepoImpl(remoteSignUp: getIt.get<RemoteSignUpImpl>()));
  getIt.registerSingleton<SignUpUseCases>(SignUpUseCases(signUpRepo: getIt.get<SignUpRepoImpl>()));


  getIt.registerSingleton<RemoteVerifyCodeImpl>(RemoteVerifyCodeImpl(api:  getIt.get<DioConsumer>()));
  getIt.registerSingleton<VerifyCodeRepoImpl>(VerifyCodeRepoImpl(remoteVerifyCode: getIt.get<RemoteVerifyCodeImpl>()));
  getIt.registerSingleton<VerifyCodeUseCases>(VerifyCodeUseCases(verifyCodeRepo: getIt.get<VerifyCodeRepoImpl>()));

  getIt.registerSingleton<RemoteResetPasswordImpl>(RemoteResetPasswordImpl(api:  getIt.get<DioConsumer>()));
  getIt.registerSingleton<ResetPasswordRepoImpl>(ResetPasswordRepoImpl(remoteResetPassword: getIt.get<RemoteResetPasswordImpl>()));
  getIt.registerSingleton<ResetPasswordUseCases>(ResetPasswordUseCases(resetPasswordRepo: getIt.get<ResetPasswordRepoImpl>()));

  getIt.registerSingleton<RemoteForgetPasswordImpl>(RemoteForgetPasswordImpl(api:  getIt.get<DioConsumer>()));
  getIt.registerSingleton<ForgetPasswordRepoImpl>(ForgetPasswordRepoImpl(remoteForgetPassword: getIt.get<RemoteForgetPasswordImpl>()));
  getIt.registerSingleton<ForgetPasswordUseCases>(ForgetPasswordUseCases(forgetPasswordRepo: getIt.get<ForgetPasswordRepoImpl>()));

  getIt.registerSingleton<RemoteAllProductImpl>(RemoteAllProductImpl(api:  getIt.get<DioConsumer>()));
  getIt.registerSingleton<AllProductRepoImpl>(AllProductRepoImpl(remoteAllProduct: getIt.get<RemoteAllProductImpl>()));
  getIt.registerSingleton<AllProductUseCase>(AllProductUseCase(allProductRepo: getIt.get<AllProductRepoImpl>()));

  getIt.registerSingleton<RemoteBrandsImpl>(RemoteBrandsImpl(api:  getIt.get<DioConsumer>()));
  getIt.registerSingleton<BrandsRepoImpl>(BrandsRepoImpl(remoteBrands: getIt.get<RemoteBrandsImpl>()));
  getIt.registerSingleton<BrandsUseCase>(BrandsUseCase(brandsRepo: getIt.get<BrandsRepoImpl>()));


  getIt.registerSingleton<RemoteCartImpl>(RemoteCartImpl(api:  getIt.get<DioConsumer>()));
  getIt.registerSingleton<CartRepoImpl>(CartRepoImpl(remoteCart: getIt.get<RemoteCartImpl>()));
  getIt.registerSingleton<CartUseCase>(CartUseCase(cartRepo: getIt.get<CartRepoImpl>()));

  getIt.registerSingleton<RemoteAllCategoriesImpl>(RemoteAllCategoriesImpl(api:  getIt.get<DioConsumer>()));
  getIt.registerSingleton<CategoriesRepoImpl>(CategoriesRepoImpl(remoteAllCategories: getIt.get<RemoteAllCategoriesImpl>()));
  getIt.registerSingleton<CategoriesUseCase>(CategoriesUseCase(categoriesRepo: getIt.get<CategoriesRepoImpl>()));


  getIt.registerSingleton<RemoteCategoriesTabImpl>(RemoteCategoriesTabImpl(api:  getIt.get<DioConsumer>()));
  getIt.registerSingleton<CategoriesTabRepoImpl>(CategoriesTabRepoImpl(remoteCategoriesTab: getIt.get<RemoteCategoriesTabImpl>()));
  getIt.registerSingleton<CategoriesTabUseCase>(CategoriesTabUseCase(categoriesTabRepo: getIt.get<CategoriesTabRepoImpl>()));


  getIt.registerSingleton<RemoteGetWishlistImpl>(RemoteGetWishlistImpl(api:  getIt.get<DioConsumer>()));
  getIt.registerSingleton<GetWishlistRepoImpl>(GetWishlistRepoImpl(remoteGetWishlist: getIt.get<RemoteGetWishlistImpl>()));
  getIt.registerSingleton<GetWishlistUseCase>(GetWishlistUseCase(getWishlistRepo: getIt.get<GetWishlistRepoImpl>()));


  getIt.registerSingleton<RemoteSpecificProductImpl>(RemoteSpecificProductImpl(api:  getIt.get<DioConsumer>()));
  getIt.registerSingleton<SpecificProductRepoImpl>(SpecificProductRepoImpl(remoteSpecificProduct: getIt.get<RemoteSpecificProductImpl>()));
  getIt.registerSingleton<SpecificProductUseCase>(SpecificProductUseCase(specificProductRepo: getIt.get<SpecificProductRepoImpl>()));


  getIt.registerSingleton<RemoteUpdateUserImpl>(RemoteUpdateUserImpl(api:  getIt.get<DioConsumer>()));
  getIt.registerSingleton<UpdateUserRepoImpl>(UpdateUserRepoImpl(remoteUpdateUser: getIt.get<RemoteUpdateUserImpl>()));
  getIt.registerSingleton<UpdateUserUseCase>(UpdateUserUseCase(updateUserRepo: getIt.get<UpdateUserRepoImpl>()));




}