import 'package:e_commrece/features/home/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_item_of_product.dart';

class ListOfFavorite extends StatelessWidget {
  const ListOfFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWishlistCubit, GetWishlistState>(
      builder: (context, state) {
        if (state is GetWishlistSuccessful) {
          return ListView.builder(
            itemCount: state.getWishlistEntity.data!.length,
            itemBuilder: (context, index) {
              return CustomItemOfProduct(type: true,
                getWishlistEntity: state.getWishlistEntity,
                index: index,);
            },
          );
        }
        else if (state is GetWishlistFailure) {
          return const Center(child: Icon(Icons.error),);
        }
        else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}


