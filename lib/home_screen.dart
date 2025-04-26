import 'package:custom_mutli_player/media_player/view/media_player.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MediaPlayer(),
                ));
          },
          child: const Text('On press'),
        ),
      ),
    );
  }
}
