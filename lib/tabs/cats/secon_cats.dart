import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/blocs/photos_bloc/photos_bloc.dart';

class SecondCats extends StatelessWidget {
  const SecondCats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<PhotosBloc, PhotosState>(
      builder: (context, state) {
        if (state is PhotosStateLoading) {
          BlocProvider.of<PhotosBloc>(context).add(LoadingDataEvent());
        }
        if (state is PhotosStateLoaded) {
          return Scaffold(
            backgroundColor: Colors.black87,
            body: Column(
              children: [
                Image.network(state.photos[0].url),
                Text(
                  state.factss!.fact,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
