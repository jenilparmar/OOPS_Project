import 'package:cinema/CinemaHall/CinemaHall.dart';
import 'package:cinema/ProfilePage/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(CineLinkApp());
}

class CineLinkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineLink',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

// Movie model
class Movie {
  final String title;
  final String releaseDate;
  final double rating;
  final String posterUrl;

  Movie({
    required this.title,
    required this.releaseDate,
    required this.rating,
    required this.posterUrl,
  });
}

class HomePage extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: "Movie 1",
      releaseDate: "2024-10-21",
      rating: 4.5,
      posterUrl: "https://via.placeholder.com/400x225",
    ),
    Movie(
      title: "Movie 2",
      releaseDate: "2024-10-22",
      rating: 4.0,
      posterUrl: "https://via.placeholder.com/400x225",
    ),
    // Add more movies
  ];

  @override
  Widget build(BuildContext context) {
    movies.sort((a, b) => b.rating.compareTo(a.rating));

    return Scaffold(
      appBar: AppBar(
        title: Text('CineLink'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.person), // Profile icon
            onPressed: () {
              // Navigate to ProfilePage when icon is clicked
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.yellow[100],
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return MovieCard(movie: movies[index]);
          },
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Cinema Hall (dummy page)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Cinemahall(
                  Platinum: 40,
                  Gold: 20,
                  Silver: 20,
                  PlatinumPrize: 500,
                  GoldPrize: 250,
                  SilverPrize: 125),
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.network(
                    movie.posterUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Release Date: ${movie.releaseDate}",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Rating: ${movie.rating}",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.green),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.star, color: Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
