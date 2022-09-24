import 'package:flutter/material.dart';
import 'package:pr1/CurrentPlaylist.dart';
import 'package:pr1/Playlists.dart';
import 'package:pr1/SignIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlaylistsLayout(),
    );
  }
}
