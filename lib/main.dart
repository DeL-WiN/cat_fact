import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/repozetoziy/api_facts.dart';
import 'package:untitled3/repozetoziy/api_photos.dart';
import 'package:untitled3/tabs/profile/controllers/login_controler.dart';
import 'package:untitled3/tabs/profile/profile.dart';
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => LoginController(),
              child: const Profile(),
          ),
          BlocProvider<PhotosBloc>(
              create: (context) =>
                  PhotosBloc(apiPhotos: ApiPhotos(), apiFact: ApiFact())),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.indigo,),
          title: 'Cats',
          initialRoute: '/',
          onGenerateRoute: (routeSettings) {
            switch (routeSettings.name) {
              case '/':
                return MaterialPageRoute(
                    builder: (context) => const Tabs(),
                    settings: routeSettings);
              default:
                return MaterialPageRoute(
                    builder: (context) => const Tabs(),
                    settings: routeSettings);
            }
          },
        ));
  }
}
