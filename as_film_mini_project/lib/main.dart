import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:as_film_mini_project/provider/login_provider.dart';
import 'package:as_film_mini_project/provider/user_provider.dart';
import 'package:as_film_mini_project/screen/splash_screen/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        // Tambahkan provider lain jika diperlukan
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AS Film Mini Project',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

