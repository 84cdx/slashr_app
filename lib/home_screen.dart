import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_recommendation_app/widgets/movie_slider.dart';
import 'package:media_recommendation_app/widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 19, 19),
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.inter(fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Aktion bei Klick auf das Icon
            },
          ),
        ],
      ),
      body: Center(
        // Parent-Widget, um den Inhalt zu zentrieren
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Trending',
                style: GoogleFonts.inter(fontSize: 18),
              ),
              const SizedBox(height: 32),
              const TrendingSlider(),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Top Rated',
                style: GoogleFonts.inter(fontSize: 18),
              ),
              const SizedBox(
                height: 32,
              ),
              const MovieSlider(),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Upcoming',
                style: GoogleFonts.inter(fontSize: 18),
              ),
              const SizedBox(
                height: 32,
              ),
              const MovieSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
