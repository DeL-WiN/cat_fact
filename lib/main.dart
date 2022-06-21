import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/repozetoziy/api_facts.dart';
import 'package:untitled3/repozetoziy/api_photos.dart';
import 'package:untitled3/tabs/cats/cats.dart';
import 'package:untitled3/tabs/tabs.dart';

import 'blocs/photos_bloc/photos_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PhotosBloc>(create: (context) => PhotosBloc(apiPhotos: ApiPhotos(), apiFact: ApiFact()))
    ],
        child: MaterialApp(
          title: 'Cats',
          initialRoute: '/',
          onGenerateRoute: (routeSettings){
        switch (routeSettings.name) {
        case '/':
        return MaterialPageRoute(builder: (context) => Tabs(), settings: routeSettings);
        default:
        return MaterialPageRoute(builder: (context) => Tabs(), settings: routeSettings);
        }
        },
        ));
  }
  }