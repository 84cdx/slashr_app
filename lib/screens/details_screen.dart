import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_recommendation_app/constants.dart';
import 'package:media_recommendation_app/models/movie.dart';
import 'package:media_recommendation_app/widgets/back_button.dart';
import 'package:media_recommendation_app/widgets/like_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final isLandscape = screenWidth > screenHeight;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        CustomScrollView(
          slivers: [
            SliverAppBar.large(
              automaticallyImplyLeading: false,
              actions: [
                const MyBackButton(),
              ],
              forceMaterialTransparency: true,
              backgroundColor: Colors.black,
              expandedHeight: isLandscape ? 200 : 400,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(
                  left: 24,
                  bottom: isLandscape ? 40 : 16,
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        movie.title,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                background: Stack(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        '${Constants.imageUrl}${movie.backDropPath}',
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black.withOpacity(0),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0),
                            Colors.black.withOpacity(1),
                          ],
                          stops: const [0.0, 1.0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      movie.overview,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 92, 92, 92)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Release date: ',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  movie.releaseDate,
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 92, 92, 92)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${movie.voteAverage.toStringAsFixed(1)} / 10',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: MyLikeButton(
            movie: movie, // Der aktuelle Film wird übergeben
          ),
        ),
      ]),
    );
  }
}
