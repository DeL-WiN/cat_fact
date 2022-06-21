import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/tabs/cats/secon_cats.dart';

import '../../blocs/photos_bloc/photos_bloc.dart';
import '../../models/photos/photos.dart';
import '../profile/profile.dart';
import '../user_favorites/user_favorites.dart';

class Cats extends StatefulWidget {
  const Cats({Key? key}) : super(key: key);

  @override
  State<Cats> createState() => _CatsState();
}

class _CatsState extends State<Cats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PhotosBloc, PhotosState>(builder: (context, state) {
        if (state is PhotosStateLoading) {
          BlocProvider.of<PhotosBloc>(context).add(LoadingDataEvent());
        }
        if (state is PhotosStateLoaded) {
          return Scaffold(
            backgroundColor: Colors.black87,
            body: Center(
              child: Container(
                child: ListView.builder(
                    itemCount: state.photos.length,
                    itemBuilder: (context, i) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SecondCats()),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
                              child: Image.network(
                                state.photos[i].url,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () => context.read<PhotosBloc>().ret(state.photos[i]) ,
                              icon: Icon(
                                Icons.favorite_border_sharp,
                                color: Colors.red,
                              )),
                        ],
                      );
                    }),
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
