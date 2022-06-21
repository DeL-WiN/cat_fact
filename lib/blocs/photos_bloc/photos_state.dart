part of 'photos_bloc.dart';


abstract class PhotosState {}

class PhotosStateLoading extends PhotosState {}

class PhotosStateLoaded extends PhotosState {
final List<Photos> photos;
final Fact? factss;
final List<Photos> favorites;
  PhotosStateLoaded(this.photos, this.factss, this.favorites);
}

