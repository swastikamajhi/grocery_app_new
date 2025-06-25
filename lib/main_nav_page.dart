import 'package:flutter/material.dart';
import 'package:new_app/pages/cart_page.dart';
import 'package:new_app/pages/grid_view_page.dart';
import 'package:new_app/pages/home_page.dart';
import 'package:new_app/pages/profile_page.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({super.key});

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    GridViewPage(),
    CartPage(),
    ProfilePage(),
  ];

  final List<BottomNavigationBarItem> navBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),

    BottomNavigationBarItem(
      icon: Icon(Icons.local_grocery_store_outlined),
      label: 'Groceries',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag_outlined),
      label: 'Cart Items',
    ),

    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey[700],
        unselectedItemColor: Colors.grey[500],
        items: navBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
