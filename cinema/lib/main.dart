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
          backgroundColor: Colors.deepPurple,
          title: const Center(
            child: Text("CineWorld"),
          ),
        ),
        body: const Cinemahall(Platinum: 40, Gold: 20, Silver: 10),
      ),
    );
  }
}