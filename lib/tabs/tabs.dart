import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/repozetoziy/api_facts.dart';
import 'package:untitled3/tabs/cats/cats.dart';
import 'package:untitled3/tabs/profile/profile.dart';
import 'package:untitled3/tabs/user_favorites/user_favorites.dart';

import '../blocs/photos_bloc/photos_bloc.dart';
import '../repozetoziy/api_photos.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int currentIndex = 2;
  final screans = [
    Cats(),
    Favorites(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PhotosBloc>(
            create: (context) => PhotosBloc(apiPhotos: ApiPhotos(), apiFact: ApiFact()))
      ],
      child: Scaffold(
        body: screans[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Cats'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
