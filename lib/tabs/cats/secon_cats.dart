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
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 400,
                height: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(catImageUrl),
                        fit: BoxFit.fitHeight))),
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 30, 4, 0),
            child: Container(
              child: Text(
                fact,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
