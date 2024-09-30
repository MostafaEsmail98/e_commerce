import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commrece/core/generated/assets.dart';
import 'package:e_commrece/core/utils/k_colors.dart';
import 'package:e_commrece/features/home/presentation/screens/tabs/categories.dart';
import 'package:e_commrece/features/home/presentation/screens/tabs/favorite.dart';
import 'package:e_commrece/features/home/presentation/screens/tabs/home.dart';
import 'package:e_commrece/features/home/presentation/screens/tabs/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  final List<Widget> pages = [
    const Home(),
    const Categories(),
    const Favorite(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex] ,
      bottomNavigationBar: BottomNavyBar(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        backgroundColor: mainColor,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: Colors.white,
              title: const Center(child: Text('Home')),
              icon: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SvgPicture.asset(Assets.imagesHome),
              )),
          BottomNavyBarItem(
              activeColor: Colors.white,
              title: const Center(child: Text('Categories')),
              icon: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SvgPicture.asset(Assets.imagesCategories),
              )),
          BottomNavyBarItem(
              activeColor: Colors.white,
              title: const Center(child: Text('Favorite')),
              icon: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SvgPicture.asset(Assets.imagesFavorite),
              )),
          BottomNavyBarItem(
              activeColor: Colors.white,
              title: const Center(child: Text('Profile')),
              icon: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SvgPicture.asset(Assets.imagesProfile),
              )),
        ],
      ),
    );
  }
}
