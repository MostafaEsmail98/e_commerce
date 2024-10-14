import 'package:e_commrece/core/utils/k_colors.dart';
import 'package:e_commrece/features/home/presentation/screens/tabs/categories.dart';
import 'package:e_commrece/features/home/presentation/screens/tabs/favorite.dart';
import 'package:e_commrece/features/home/presentation/screens/tabs/home.dart';
import 'package:e_commrece/features/home/presentation/screens/tabs/profile.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../generated/assets.dart';


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
    return Scaffold(
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
    );
  }
}
