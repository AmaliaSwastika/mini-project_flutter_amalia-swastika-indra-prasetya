import 'package:flutter/material.dart';
import 'package:as_film_mini_project/model/api/film_api.dart';
import 'package:as_film_mini_project/model/film_model.dart';
import 'package:as_film_mini_project/screen/splash_screen/splash_screen.dart';
import 'package:as_film_mini_project/theme/theme_color.dart';
import 'package:as_film_mini_project/theme/theme_text_style.dart';
import 'package:as_film_mini_project/utils/shared_preferences.dart';
import 'package:as_film_mini_project/widget/film/now_playing_film_slider_widget.dart';
import 'package:as_film_mini_project/widget/film/film_slider_widget.dart';

class FilmScreen extends StatefulWidget {
  const FilmScreen({super.key});

  @override
  State<FilmScreen> createState() => _FilmScreenState();
}

  class _FilmScreenState extends State<FilmScreen> {
  
  String _username = ""; 

  late Future<List<FilmModel>> nowPlayingFilm;
  late Future<List<FilmModel>> popularFilm;
  late Future<List<FilmModel>> upcomingFilm;

  @override
  void initState() {
    super.initState();
    nowPlayingFilm = FilmAPI().getNowPlayingFilm();
    popularFilm = FilmAPI().getPopularFilm();
    upcomingFilm = FilmAPI().getUpcomingFilm();
    _getUsername().then((username) {
      setState(() {
      _username = username;
      });
    });
  }

  Future<String> _getUsername() async {
    final username = await SharedPref().getToken(); 
    return username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor().white2Color,
      appBar: AppBar(
        backgroundColor: ThemeColor().blue2Color,
        title: Text(
          'AS FILM',
          style: ThemeTextStyle().asFilm,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: ThemeColor().white2Color,
            onPressed: () async {
                await SharedPref().removeToken();
                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SplashScreen(),
                    ),
                    (route) => false);
            }
          )
        ],
      ),
      
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center( 
              child: Text(
              'Welcome! $_username',
              style: ThemeTextStyle().welcomeUsername,
              ),
            ),

            const SizedBox(height: 30),
            Padding( 
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
              "Now Playing Film",
              style: ThemeTextStyle().film,
              ),
            ),

            const SizedBox(height: 10),
            SizedBox(
              child: FutureBuilder(
                future: nowPlayingFilm,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return NowPlayingSliderWidget(snapshot: snapshot);
                  } else {
                    return const Center (child: CircularProgressIndicator());
                  }
                },
              ),
            ),

            const SizedBox(height: 30),
            Padding( 
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
              "Popular Film",
              style: ThemeTextStyle().film,
              ),
            ),

            const SizedBox(height: 1),
             SizedBox(
              child: FutureBuilder(
                future: popularFilm,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return FilmSliderWidget(snapshot: snapshot);
                  } else {
                    return const Center (child: CircularProgressIndicator());
                  }
                },
              ),
            ),

             const SizedBox(height: 30),
            Padding( 
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
              "Upcoming Film",
              style: ThemeTextStyle().film,
              ),
            ),

             const SizedBox(height: 1),
             SizedBox(
              child: FutureBuilder(
                future: upcomingFilm,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return FilmSliderWidget(snapshot: snapshot);
                  } else {
                    return const Center (child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}