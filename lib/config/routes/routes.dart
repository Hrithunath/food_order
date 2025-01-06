import 'package:flutter/material.dart';
import 'package:food/features/data/presentation/pages/home.dart';
import 'package:food/features/data/presentation/pages/notification.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/home': (context) => const Home(),
    '/notification': (context) => const Notifications()
  };
}
