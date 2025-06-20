import 'package:flutter/material.dart';
import 'package:new_app/models/cart_item_model.dart';
import 'package:new_app/views/cart_page.dart';
import 'package:new_app/views/grid_view_page.dart';
import 'package:new_app/views/home_page.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({super.key});

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  int _selectedIndex = 0;

  List<CartItemModel> cartItems = [];

  void addCartItem(CartItemModel cartItem) {
    setState(() {
      cartItems.add(cartItem);
    });
  }

  void removeCartItem(CartItemModel cartItem) {
    setState(() {
      cartItems.remove(cartItem);
    });
  }

  List<Widget> _pages = [];

  final navBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_grocery_store_outlined),
      label: 'Groceries',
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag_outlined),
      label: 'Cart Page',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      HomePage(),
      GridViewPage(
        addCartItem: (CartItemModel cartItem) {
          addCartItem(cartItem);
        }, // fruits detail page, add to cart, cartItem (Fruits Detail Page) -> Grid View Page -> MainNavPage
        //Main Nav Page -> Add Items to Cart -> Pass that cart item to Cart Page
      ),
      CartPage(
        cartItems: cartItems,
        removeCartItem: (cartItemModel) {
          removeCartItem(cartItemModel);
        },
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: navBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
