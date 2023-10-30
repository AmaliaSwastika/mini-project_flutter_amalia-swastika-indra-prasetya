import 'package:flutter/material.dart';
import 'package:as_film_mini_project/utils/constants.dart';
import 'package:as_film_mini_project/screen/detail_film/detail_film_screen.dart';

class FilmSliderWidget extends StatelessWidget {
  const FilmSliderWidget({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
      itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailFilmScreen(
                    filmModel: snapshot.data[index],
                  ),
                ),
              );
            },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                width: 150,
                  child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  "${Constants.imagePath}${snapshot.data![index].posterPath}"
                ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}