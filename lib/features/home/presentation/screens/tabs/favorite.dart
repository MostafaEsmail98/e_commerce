import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commrece/features/home/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_logo_and_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_list_of_favorite.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetWishlistCubit()..getWishlist(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GetWishlistCubit, GetWishlistState>(
            listener: (context, state) {
              if (state is PostWishlistSuccessful) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.postWishlistModel.message!)));
              } else if (state is PostWishlistFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorModel)));
              } else if (state is DeleteWishlistSuccessful) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.deleteWishlistModel.message!)));
              } else if (state is DeleteWishlistFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorModel)));
              }
            },
          ),
          BlocListener<CartCubit, CartState>(
            listener: (context, state) {
              if (state is CartAddSuccessful) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.res)));
              } else if (state is CartAddFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
          )
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomLogoAndSearch(),
              CustomSpaceHeight(height: .02),
              Expanded(child: ListOfFavorite())
            ],
          ),
        ),
      ),
    );
  }
}
