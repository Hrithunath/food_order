import 'package:flutter/material.dart';
import 'package:food/core/utils/connection_checker.dart';
import 'package:food/features/data/presentation/pages/account.dart';
import 'package:food/features/data/presentation/pages/cart.dart';
import 'package:food/features/data/presentation/pages/home.dart';
import 'package:food/features/data/presentation/pages/order.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   // Listen for connection changes
  //   ConnectionChecker.listenForConnectionChanges(context);
  // }

  // @override
  // void dispose() {
  //   // Cancel connection subscription when disposed
  //   ConnectionChecker.cancelConnectionSubscription();
  //   super.dispose();
  // }

  final List<Widget> _pages = [
    const Home(),
    const Cart(),
    const Order(),
    const Account(),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color.fromARGB(255, 255, 254, 254),
        selectedItemColor: const Color.fromARGB(255, 51, 210, 124),
        unselectedItemColor: const Color.fromARGB(255, 212, 212, 212),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'My Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
