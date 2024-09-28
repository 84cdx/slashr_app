import 'dart:ui'; // Vergiss nicht, diesen Import hinzuzufügen
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_recommendation_app/colors.dart';
import 'package:media_recommendation_app/constants.dart';
import 'package:media_recommendation_app/models/movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            automaticallyImplyLeading:
                false, // Verhindert den Standard-Zurück-Pfeil
            actions: [
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(top: 16, right: 16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
              ),
            ],
            backgroundColor:
                Colors.transparent, // Setze Hintergrund auf transparent
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                children: [
                  // Hintergrundbild
                  Image.network(
                    '${Constants.imageUrl}${movie.backDropPath}',
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                  // Blur Effekt
                  BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0), // Grad der Unschärfe anpassen
                    child: Container(
                      color: Colors.black.withOpacity(
                          0.5), // Optional: Dunkler Overlay für besseren Kontrast
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
