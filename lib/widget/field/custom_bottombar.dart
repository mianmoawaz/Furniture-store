import 'package:flutter/material.dart';
import 'package:furniture_store/user/add_to_cart.dart';
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
    _currentIndex = widget.selectedIndex; // ✅ Selected Index Set
  }

  // ✅ Screens List
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchProduct(),
    const AddToCart(),
    const Profile(),
  ];

  // ✅ Titles for AppBar
  final List<String> _titles = [
    "Home",
    "Search",
    "Cart",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_titles[_currentIndex]), // ✅ Show Screen Title
      //   centerTitle: true,
      // ),
      body: _screens[_currentIndex], // ✅ Show Selected Screen
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() => _currentIndex = i);
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
