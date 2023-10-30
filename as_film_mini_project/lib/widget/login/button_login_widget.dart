import 'package:flutter/material.dart';
import 'package:as_film_mini_project/theme/theme_color.dart';
import 'package:as_film_mini_project/theme/theme_text_style.dart';

class ButtonLogin extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const ButtonLogin({
    super.key, 
    required this.title, 
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
      backgroundColor: ThemeColor().blue2Color,
      padding: const EdgeInsets.symmetric(horizontal: 130.0, vertical: 15.0),
      ),
      onPressed: onPressed, 
      child: Text(
        'Login',
        style: ThemeTextStyle().login,
      ),
    );
  }
}