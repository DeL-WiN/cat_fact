import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/tabs/cats/secon_cats.dart';

import '../../blocs/photos_bloc/photos_bloc.dart';

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
                            BlocProvider.of<PhotosBloc>(context)
                                .add(LoadingFactsEvent());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondCats(
                                        fact: state.factss!.fact,
                                        catImageUrl: state.photos[i].url,
                                      )),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                            child: Container(
                              height: 400,
                              width: 400,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    state.photos[i].url,
                                  ),
                                  fit: BoxFit.fitHeight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        // LikeButton(
                        //   circleColor: CircleColor(start: Colors.red, end: Colors.red),
                        //   likeBuilder: (bool isLiked) {
                        //     return Icon(
                        //       Icons.favorite,
                        //       color: isLiked ? Colors.red: Colors.white60,
                        //     );
                        //   },
                        //   countBuilder: (int? count, bool isLiked, String text) {
                        //     BlocProvider.of<PhotosBloc>(context)
                        //         .add(LoadingFactsEvent());
                        //     Widget result;
                        //     if (isLiked == false) {
                        //     result = context.read<PhotosBloc>().favorit(state.photos[i]);
                        //     } else
                        //     context.read<PhotosBloc>().deleteFavorit(i);
                        //   },
                        // ),
                        IconButton(
                            onPressed: () {
                           setState(() {
                             context.read<PhotosBloc>().favorit(state.photos[i]);
                           });
                              },
                            icon: const Icon(
                              Icons.favorite_border_sharp,
                              color: Colors.red,
                            )),
                      ],
                    );
                  }),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
