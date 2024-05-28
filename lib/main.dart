import 'package:flutter/material.dart';
import 'package:food_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'providers/food_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => FoodProvider(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const SplashScreen(),
    );
  }
}