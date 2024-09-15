import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commrece/core/utils/k_colors.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [],
      ),
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
          BottomNavyBarItem(title: Text('Item One'), icon: Icon(Icons.home)),
          BottomNavyBarItem(title: Text('Item Two'), icon: Icon(Icons.apps)),
          BottomNavyBarItem(
              title: Text('Item Three'), icon: Icon(Icons.chat_bubble)),
          BottomNavyBarItem(
              title: Text('Item Four'), icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
