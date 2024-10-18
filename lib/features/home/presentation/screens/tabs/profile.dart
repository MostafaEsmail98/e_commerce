import 'package:e_commrece/core/utils/app_styles.dart';
import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/features/home/presentation/manager/update_user_cubit/update_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/utils/k_colors.dart';
import '../../../../../core/utils/routes.dart';
import '../../../../../generated/assets.dart';
import '../../widgets/custom_field_of_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateUserCubit()..getUser(),
      child: BlocListener<UpdateUserCubit, UpdateUserState>(
        listener: (context, state) {
          if (state is UpdateUserSuccessful) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.updateUserModel.message!)));
          } else if (state is UpdateUserFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is ChangePasswordSuccessful) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.result)));
            context
                .read<UpdateUserCubit>()
                .currentPasswordController
                .clear();
            context
                .read<UpdateUserCubit>()
                .newPasswordController
                .clear();
            context
                .read<UpdateUserCubit>()
                .renewPasswordController
                .clear();
            CacheHelper.removeData(key: "token");
            GoRouter.of(context).pushReplacement(AppRouter.signIn);
          } else if (state is ChangePasswordFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<UpdateUserCubit, UpdateUserState>(
            builder: (context, state) {
              if (state is GetUserSuccessful) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        Assets.assetsImagesLogo,
                        width: 120,
                        colorFilter:
                            const ColorFilter.mode(mainColor, BlendMode.srcIn),
                      ),
                      Text(
                        "Welcome, ${state.getUserModel.data?.name ?? ""}",
                        style: AppStyles.textMedium20(context),
                      ),
                      const CustomSpaceHeight(height: .001),
                      Text(
                        state.getUserModel.data!.email ?? "",
                        style: AppStyles.textMedium14(context),
                      ),
                      const CustomSpaceHeight(height: .04),
                      InkWell(
                        onTap: () {
                          showCustomEditProfileDialog(
                              context,
                              context.read<UpdateUserCubit>().nameController,
                              context.read<UpdateUserCubit>().emailController,
                              context.read<UpdateUserCubit>().mobilController,
                              () {
                            context.read<UpdateUserCubit>().updateUser();
                            context
                                .read<UpdateUserCubit>()
                                .nameController
                                .clear();
                            context
                                .read<UpdateUserCubit>()
                                .emailController
                                .clear();
                            context
                                .read<UpdateUserCubit>()
                                .mobilController
                                .clear();
                            Navigator.of(context).pop();
                          });
                        },
                        child: CustomFieldOfProfile(
                          title: 'Your full name',
                          content: state.getUserModel.data!.name ?? "",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showCustomEditProfileDialog(
                              context,
                              context.read<UpdateUserCubit>().nameController,
                              context.read<UpdateUserCubit>().emailController,
                              context.read<UpdateUserCubit>().mobilController,
                              () {
                            context.read<UpdateUserCubit>().updateUser();
                            context
                                .read<UpdateUserCubit>()
                                .nameController
                                .clear();
                            context
                                .read<UpdateUserCubit>()
                                .emailController
                                .clear();
                            context
                                .read<UpdateUserCubit>()
                                .mobilController
                                .clear();
                            Navigator.of(context).pop();
                          });
                        },
                        child: CustomFieldOfProfile(
                          title: 'Your E-mail',
                          content: state.getUserModel.data!.email ?? "",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showChangePasswordDialog(
                              context,
                              context
                                  .read<UpdateUserCubit>()
                                  .currentPasswordController,
                              context
                                  .read<UpdateUserCubit>()
                                  .newPasswordController,
                              context
                                  .read<UpdateUserCubit>()
                                  .renewPasswordController, () {
                            context.read<UpdateUserCubit>().changePassword();
                            Navigator.of(context).pop();
                          });
                        },
                        child: const CustomFieldOfProfile(
                          title: 'Your password',
                          content: '*****************',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showCustomEditProfileDialog(
                              context,
                              context.read<UpdateUserCubit>().nameController,
                              context.read<UpdateUserCubit>().emailController,
                              context.read<UpdateUserCubit>().mobilController,
                              () {
                            context.read<UpdateUserCubit>().updateUser();
                            context
                                .read<UpdateUserCubit>()
                                .nameController
                                .clear();
                            context
                                .read<UpdateUserCubit>()
                                .emailController
                                .clear();
                            context
                                .read<UpdateUserCubit>()
                                .mobilController
                                .clear();
                            Navigator.of(context).pop();
                          });
                        },
                        child: CustomFieldOfProfile(
                          title: 'Your mobile number',
                          content: state.getUserModel.data!.phone ?? "",
                        ),
                      ),
                      const CustomFieldOfProfile(
                        title: 'Your Address',
                        content: '6th October, street 11.....',
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(mainColor)),
                              onPressed: () {
                                CacheHelper.removeData(key: "token");
                                GoRouter.of(context).pushReplacement(AppRouter.signIn);
                              },
                              child: Text(
                                "Sign Out",
                                style: AppStyles.textRegular14(context)
                                    .copyWith(color: Colors.white),
                              )))
                    ],
                  ),
                );
              } else if (state is GetUserFailure) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void showCustomEditProfileDialog(
      BuildContext context,
      TextEditingController name,
      TextEditingController email,
      TextEditingController phone,
      void Function()? function) {
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Your Profile'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFieldOfProfile(
                  title: "Name",
                  controller: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                CustomTextFieldOfProfile(
                  title: "Phone",
                  controller: phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                CustomTextFieldOfProfile(
                  title: "Email",
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: function,
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void showChangePasswordDialog(
      BuildContext context,
      TextEditingController current,
      TextEditingController newPass,
      TextEditingController reNewPass,
      void Function()? function) {
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Password'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFieldOfProfile(
                  title: 'Current Password',
                  controller: current,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current password';
                    }
                    return null;
                  },
                ),
                CustomTextFieldOfProfile(
                  title: 'New Password',
                  controller: newPass,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                CustomTextFieldOfProfile(
                    title: 'Re-enter New Password',
                    controller: reNewPass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your new password';
                      } else if (value != newPass.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    }),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                newPass.clear();
                current.clear();
                reNewPass.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: function,
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class CustomTextFieldOfProfile extends StatelessWidget {
  const CustomTextFieldOfProfile({
    super.key,
    required this.controller,
    required this.title,
    this.validator,
  });

  final TextEditingController controller;

  final String title;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              labelText: title,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)))),
          validator: validator),
    );
  }
}
