import 'package:flutter/material.dart';
import 'package:furniture_store/user/detail_screen.dart';
import 'package:furniture_store/user/home_screen.dart';
import 'package:furniture_store/user/profile.dart';
import 'package:furniture_store/user/search_product.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottombar extends StatefulWidget {
  final int selectedIndex;
  const CustomBottombar({super.key, this.selectedIndex = 0});

  @override
  State<CustomBottombar> createState() => _CustomBottombarState();
}

class _CustomBottombarState extends State<CustomBottombar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchProduct(),
    const DetailScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text("Cart"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
