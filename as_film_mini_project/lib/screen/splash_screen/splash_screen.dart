import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:as_film_mini_project/screen/splash_screen/splash_screen_view_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SplashScreenViewModel>(context);

    if (viewModel.isLoading) {
      viewModel.disableLoading(); // Jalankan method untuk menonaktifkan isLoading
    }

    //Splash screen icon film
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/film.png',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
