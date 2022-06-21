import 'package:flutter/material.dart';

class SecondCats extends StatelessWidget {
  final String fact;
  final String catImageUrl;

  const SecondCats({Key? key, required this.fact, required this.catImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Image.network(catImageUrl),
          Text(
            fact,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
