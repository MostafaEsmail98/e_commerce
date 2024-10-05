import 'package:flutter/material.dart';
import 'custom_item_of_product.dart';

class ListOfFavorite extends StatelessWidget {
  const ListOfFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       itemCount: 20,
      itemBuilder: (context, index) {
        return const CustomItemOfProduct(type: true,);
      },
    );
  }
}


