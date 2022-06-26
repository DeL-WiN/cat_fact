part of 'photos_bloc.dart';


abstract class PhotosState {

  copyWith({required Photos currentUser}) {}
}

class PhotosStateLoading extends PhotosState {}

class PhotosStateLoaded extends PhotosState {
final List<Photos> photos;
final Fact? factss;
final List<Photos> favorites;
  PhotosStateLoaded(this.photos, this.factss, this.favorites);
}

