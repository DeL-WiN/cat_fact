import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';

import '../../blocs/photos_bloc/photos_bloc.dart';
import '../cats/secon_cats.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return BlocBuilder<PhotosBloc, PhotosState>(builder: (context, state) {
      if (state is PhotosStateLoading) {
        BlocProvider.of<PhotosBloc>(context).add(LoadingDataEvent());
      }
      if (state is PhotosStateLoaded) {
        return Scaffold(
          backgroundColor: Colors.black87,
          body: Center(
            child: Container(
              child: ListView.builder(
                  itemCount: state.favorites.length,
                  itemBuilder: (context, i) {
                    return SizedBox(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                      catImageUrl: state.favorites[i].url,
                      )),
                      );
                      },
                        child:
                        Container(
                              height: 400,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    state.favorites[i].url,
                                  ),
                                  fit: BoxFit.fitHeight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            ),
                    //         LikeButton(
                    //           circleColor: CircleColor(start: Colors.red, end: Colors.red),
                    //           likeBuilder: (bool isLiked) {
                    //             return Icon(
                    //                 Icons.favorite,
                    //               color: isLiked ? Colors.red: Colors.white60,
                    //             );
                    //           },
                    //           countBuilder: (int? count, bool isLiked, String text) {
                    //             BlocProvider.of<PhotosBloc>(context)
                    //                 .add(LoadingFactsEvent());
                    // Widget result;
                    // if (count == 0) {
                    // context.read<PhotosBloc>().deleteFavorit(i);
                    // } else
                    //   context.read<PhotosBloc>().favorit(state.photos[i]);
                    //           },
                    //         ),
                            IconButton(
                                onPressed: () =>
                                    context.read<PhotosBloc>().deleteFavorit(i),
                                icon: const Icon(
                                  Icons.favorite_border_sharp,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        );
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
