import 'package:flutter/material.dart';
import 'package:media_recommendation_app/constants.dart';
import 'package:media_recommendation_app/models/movie.dart';
import 'package:media_recommendation_app/screens/details_screen.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot<List<Movie>> snapshot;

  @override
  Widget build(BuildContext context) {
    if (snapshot.data == null || snapshot.data!.isEmpty) {
      return const Center(child: Text('No movies found.'));
    }

    return SizedBox(
      height: 225,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      movie: snapshot.data![index],
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 41, 41, 41),
                      width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 225,
                    width: 150,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${Constants.imageUrl}${snapshot.data![index].posterPath}',
                    ),
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
