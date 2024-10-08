import 'package:e_commrece/core/utils/k_colors.dart';
import 'package:e_commrece/features/home/presentation/screens/tabs/categories.dart';
import 'package:e_commrece/features/home/presentation/screens/tabs/favorite.dart';
import 'package:e_commrece/features/home/presentation/screens/tabs/home.dart';
import 'package:e_commrece/features/home/presentation/screens/tabs/profile.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../generated/assets.dart';
import '../manager/get_wishlist_cubit/get_wishlist_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> pages = [
    const Home(),
    const Categories(),
    const Favorite(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetWishlistCubit, GetWishlistState>(
      listener: (context, state) {
        if (state is PostWishlistSuccessful) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.postWishlistModel.message!)));
        } else if (state is PostWishlistFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorModel.errMassage)));
        } else if (state is DeleteWishlistSuccessful) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.deleteWishlistModel.message!)));
        }else if (state is DeleteWishlistFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorModel.errMassage)));
        }
      },
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          child: FlashyTabBar(
            backgroundColor: mainColor,
            selectedIndex: _currentIndex,
            showElevation: true,
            onItemSelected: (index) => setState(() {
              _currentIndex = index;
              if (index == 2) {
                context.read<GetWishlistCubit>().getWishlist();
              }
            }),
            items: [
              FlashyTabBarItem(
                  activeColor: Colors.white,
                  title: const Center(child: Text('Home')),
                  icon: SvgPicture.asset(Assets.imagesHome)),
              FlashyTabBarItem(
                  activeColor: Colors.white,
                  title: const Center(child: Text('Categories')),
                  icon: SvgPicture.asset(Assets.imagesCategories)),
              FlashyTabBarItem(
                  activeColor: Colors.white,
                  title: const Center(child: Text('Favorite')),
                  icon: SvgPicture.asset(Assets.imagesFavorite)),
              FlashyTabBarItem(
                  activeColor: Colors.white,
                  title: const Center(child: Text('Profile')),
                  icon: SvgPicture.asset(Assets.imagesProfile)),
            ],
          ),
        ),
      ),
    );
  }
}
