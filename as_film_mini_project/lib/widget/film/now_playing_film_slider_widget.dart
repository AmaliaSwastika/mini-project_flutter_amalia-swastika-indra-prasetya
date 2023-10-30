import 'package:as_film_mini_project/utils/constants.dart';
import 'package:as_film_mini_project/screen/detail_film/detail_film_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NowPlayingSliderWidget extends StatelessWidget {
  const NowPlayingSliderWidget({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        // itemCount: 10, 
        itemCount: snapshot.data!.length,
        options: CarouselOptions (
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true ,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(milliseconds: 600),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailFilmScreen(
                    filmModel: snapshot.data[itemIndex],
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
              height: 300,
              width: 200,
              child: Image.network(
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                "${Constants.imagePath}${snapshot.data![itemIndex].posterPath}"
              ),   
            ),
            )
          );
        },
      ),
    );
  }
}