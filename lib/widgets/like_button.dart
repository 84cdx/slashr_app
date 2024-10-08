import 'package:flutter/material.dart';
import 'package:media_recommendation_app/main.dart';
import 'package:media_recommendation_app/models/movie.dart';

class MyLikeButton extends StatefulWidget {
  final Movie movie;

  const MyLikeButton({super.key, required this.movie});

  @override
  _MyLikeButtonState createState() => _MyLikeButtonState();
}

class _MyLikeButtonState extends State<MyLikeButton> {
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    // Überprüfen, ob der Film in den Favoriten ist
    _isLiked = favoriteMovies.contains(widget.movie);
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        favoriteMovies.add(widget.movie);
      } else {
        favoriteMovies.remove(widget.movie);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        border: Border.all(color: const Color.fromARGB(255, 92, 92, 92)),
      ),
      child: IconButton(
        onPressed: _toggleLike,
        icon: Icon(
          Icons.favorite,
          color: _isLiked ? Colors.red : Colors.white,
        ),
      ),
    );
  }
}
