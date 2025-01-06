import 'package:flutter/material.dart';
import 'package:food/views/screens/home.dart';
import 'package:food/views/screens/notification.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/home': (context) => const Home(),
    '/notification': (context) => const Notifications()
  };
}
