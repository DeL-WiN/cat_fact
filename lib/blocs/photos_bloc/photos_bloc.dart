import '../../models/facts/fact/fact.dart';
import '../../models/photos/photos.dart';
import '../../repozetoziy/api_facts.dart';
import '../../repozetoziy/api_photos.dart';
import 'package:bloc/bloc.dart';
part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final ApiPhotos apiPhotos;
  final ApiFact apiFact;

  PhotosBloc({required this.apiPhotos, required this.apiFact}) : super(PhotosStateLoading()) {
    on<PhotosEvent>((event, emit) {
      if (event is LoadingDataEvent) {
        return _loadData(event, emit);
      }
    });
    add(LoadingDataEvent());
  }

  Future<void> _loadData(PhotosEvent event, Emitter<PhotosState> emit) async {
    final photos = await apiPhotos.getPost();
    final facts = await apiFact.getHttp();
    emit(PhotosStateLoaded(photos, facts, []));
  }

  void ret(Photos boal) {
    final mystate = state as PhotosStateLoaded;
    var favorite = mystate.favorites;
    favorite.add(boal);
    emit(PhotosStateLoaded(mystate.photos, mystate.factss, favorite));
  }
}

