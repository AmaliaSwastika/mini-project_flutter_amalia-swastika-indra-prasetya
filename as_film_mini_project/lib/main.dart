import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/splash_screen/splash_screen.dart';
import 'package:as_film_mini_project/screen/splash_screen/splash_screen_view_model.dart';
import 'package:as_film_mini_project/screen/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashScreenViewModel(), 
      child: MaterialApp(
        title: 'AS Film Mini Project',
        home: Consumer<SplashScreenViewModel>(
          builder: (context, viewModel, child) {
            return viewModel.isLoading ? const SplashScreen() : const LoginScreen(); 
          },
        ),
      ),
    );
  }
}
