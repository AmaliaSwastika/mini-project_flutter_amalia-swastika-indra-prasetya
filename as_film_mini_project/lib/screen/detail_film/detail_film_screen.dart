import 'package:flutter/material.dart';
import 'package:as_film_mini_project/widget/detail_film/back_button_widget.dart';
import 'package:as_film_mini_project/theme/theme_color.dart';
import 'package:as_film_mini_project/theme/theme_text_style.dart';
import 'package:as_film_mini_project/utils/constants.dart';
import 'package:as_film_mini_project/model/film_model.dart';

class DetailFilmScreen extends StatelessWidget {

  final FilmModel filmModel;

  const DetailFilmScreen({
    Key? key, required this.filmModel
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    backgroundColor: ThemeColor().blue3Color,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const BackBtn(),
            // backgroundColor: Colours.scaffoldBgColor,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(
              //   filmModel.title,
              //   style: ThemeTextStyle().titleFilm,
              // ),
              
              background: ClipRRect(
                child: Image.network(
                  "${Constants.imagePath}${filmModel.posterPath}",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  
                  Text(
                    "Overview",
                    style: ThemeTextStyle().overviewFilm,
                  ),

                  const SizedBox(height: 16),
                  Text(
                    filmModel.overview,
                    style: ThemeTextStyle().overviewFilm2,
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 16),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: ThemeColor().whiteColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(children: [
                          Text(
                            "Release date :",
                            style: ThemeTextStyle().releaseRating
                          ),
                          Text(
                            filmModel.releaseDate,
                            style: ThemeTextStyle().releaseRating
                          ),
                        ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration (
                          border: Border.all(color: ThemeColor().whiteColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row (
                          children:  [
                            Text("Rating",
                            style: ThemeTextStyle().releaseRating
                            ),
                            Icon(
                              Icons.star, 
                              color: ThemeColor().ratingColor
                              ),
                              Text(
                                "${filmModel.voteAverage.toStringAsFixed(1)}/10",
                               style: ThemeTextStyle().releaseRating
                            ),
                          ],
                          )
                      )
                    ]),
                  )
                ],
              ),
              )
          )
        ],
      ),
    );
  }
}