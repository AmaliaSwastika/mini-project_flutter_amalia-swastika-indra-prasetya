import 'package:as_film_mini_project/model/user_model.dart';
import 'package:as_film_mini_project/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:as_film_mini_project/screen/film/film_screen.dart';
import 'package:as_film_mini_project/screen/login/login_screen.dart';
import 'package:as_film_mini_project/utils/shared_preferences.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E4374),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/film.png",
              width: 100,
              height: 100,
            ),
            Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                // Di sini kita memeriksa status login menggunakan UserProvider
                checkLogin(context, userProvider);
                return const SizedBox(); // Ini akan menghilangkan indikator loading.
              },
            ),
          ],
        ),
      ),
    );
  }

  void checkLogin(BuildContext context, UserProvider userProvider) async {
    String token = await SharedPref().getToken();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (token.isNotEmpty) {
          userProvider.setUser(UserModel(token));
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const FilmScreen()),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        }
      },
    );
  }
}
