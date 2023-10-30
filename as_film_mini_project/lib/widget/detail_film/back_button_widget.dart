import 'package:flutter/material.dart';
import 'package:as_film_mini_project/theme/theme_color.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(
        top: 16,
        left: 16,
      ),
      decoration: BoxDecoration(
        color: ThemeColor().blue3Color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          color: ThemeColor().white2Color,
          Icons.arrow_back_rounded,
        ),
      ),
    );
  }
}
