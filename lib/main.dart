import 'package:flutter/material.dart';
import 'package:food/routes/routes.dart';
import 'package:food/views/screens/bottom_navigation.dart';
import 'package:food/views/screens/home.dart';
import 'package:food/services/api_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DataManage())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: Routes.routes,
        home: const Home(),
      ),
    );
  }
}
