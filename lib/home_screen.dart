import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                'Trending Movies',
                style: GoogleFonts.inter(fontSize: 18),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                    itemCount: 10,
                    options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      viewportFraction: 0.55,
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pageSnapping: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                    ),
                    itemBuilder: (context, itemIndex, pageViewIndex) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: const Color.fromARGB(255, 117, 117, 117),
                          height: 300,
                          width: 200,
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
