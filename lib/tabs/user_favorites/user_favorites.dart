import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              // child: ListView.builder(
              //   scrollDirection: Axis.vertical,
              //     itemCount:
              //     itemBuilder:
            ),
          ],
        ),
      ),
    );
  }
}
lox