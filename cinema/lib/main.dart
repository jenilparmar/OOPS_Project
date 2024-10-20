import 'package:cinema/CinemaHall/CinemaHall.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 238, 0),
          title: const Center(
            child: Text(
              "CineWorld",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: const Cinemahall(
          Platinum: 40,
          Gold: 20,
          Silver: 10,
          PlatinumPrize: 500,
          GoldPrize: 250,
          SilverPrize: 100,
        ),
      ),
    );
  }
}
