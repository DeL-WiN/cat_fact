part of 'photos_bloc.dart';

abstract class PhotosEvent {}

class LoadingDataEvent extends PhotosEvent {}

class LoadingFactsEvent extends PhotosEvent {}

class LoadingFavoritesEvent extends PhotosEvent {}
