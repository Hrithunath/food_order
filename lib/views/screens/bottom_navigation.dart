import 'package:flutter/material.dart';
import 'package:food/utils/connection_checker.dart';
import 'package:food/views/screens/account.dart';
import 'package:food/views/screens/cart.dart';
import 'package:food/views/screens/home.dart';
import 'package:food/views/screens/order.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    ConnectionChecker.listenForConnectionChanges(context);
    super.initState();
  }

  @override
  void dispose() {
    ConnectionChecker.cancelConnectionSubscription();
    super.dispose();
  }

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
