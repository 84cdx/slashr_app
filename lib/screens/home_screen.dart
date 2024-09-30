import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_recommendation_app/api/api.dart';
import 'package:media_recommendation_app/main.dart';
import 'package:media_recommendation_app/models/movie.dart';
import 'package:media_recommendation_app/screens/details_screen.dart';
import 'package:media_recommendation_app/screens/search_screen.dart';
import 'package:media_recommendation_app/widgets/movie_slider.dart';
import 'package:media_recommendation_app/widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> recentMovies;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies(40);
    upcomingMovies = Api().getUpcomingMovies(8);
    recentMovies = _getFilteredRecentMovies();
  }

  Future<List<Movie>> _getFilteredRecentMovies() async {
    List<Movie> recentlyReleased = await Api().getRecentMovies(3);
    List<Movie> trending = await trendingMovies;

    Set<String> trendingTitles = trending.map((movie) => movie.title).toSet();

    return recentlyReleased
        .where((movie) => !trendingTitles.contains(movie.title))
        .toList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MyApp.routeObserver
        .subscribe(this, ModalRoute.of(context)! as PageRoute<dynamic>);
  }

  @override
  void dispose() {
    MyApp.routeObserver.unsubscribe(this);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didPopNext() {
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Text(
          'Explore',
          style: GoogleFonts.inter(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search for a movie...',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(80, 255, 255, 255),
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                    filled: true,
                    fillColor: Color.fromARGB(255, 29, 29, 29),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.search,
                        color: Color.fromARGB(80, 255, 255, 255)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      String encodedQuery = Uri.encodeComponent(value);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchScreen(query: Uri.encodeComponent(value)),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Trending',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return TrendingSlider(
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Recently Released',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: SizedBox(
                child: FutureBuilder(
                  future: recentMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MovieSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Upcoming',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: SizedBox(
                child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MovieSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'All-Time Top Rated',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MovieSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
