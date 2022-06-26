import 'package:bloc/bloc.dart';
import '../../models/facts/fact/fact.dart';
import '../../models/photos/photos.dart';
import '../../repozetoziy/api_facts.dart';
import '../../repozetoziy/api_photos.dart';
import '../provider/photo_provider.dart';

part 'photos_event.dart';

part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final _photosProvider = PhotosProvider();
  final ApiPhotos apiPhotos;
  final ApiFact apiFact;

  PhotosBloc({required this.apiPhotos, required this.apiFact})
      : super(PhotosStateLoading()) {
    on<PhotosEvent>((event, emit) {
      if (event is LoadingDataEvent) {
        return _loadData(event, emit);
      }
      if (event is LoadingFactsEvent) {
        return _loadFact(event, emit);
      }
    });
    add(LoadingDataEvent());
    _initialize();
  }

  Future<void> _loadData(PhotosEvent event, Emitter<PhotosState> emit) async {
    final photos = await apiPhotos.getPost();
    final facts = await apiFact.getHttp();

    final _state = state;
    if (_state is PhotosStateLoaded) {
      final favorites = _state.favorites;
      emit(PhotosStateLoaded(photos, facts, favorites));
    }
  }

  Future<void> _loadFact(PhotosEvent event, Emitter<PhotosState> emit) async {
    final facts = await apiFact.getHttp();
    final photo = state as PhotosStateLoaded;
    final image = photo.photos;

    final _state = state;
    if (_state is PhotosStateLoaded) {
      final favorites = _state.favorites;
      emit(PhotosStateLoaded(image, facts, favorites));
    }
  }

  Future<void> _initialize() async {
    final photos = await _photosProvider.loadValue();

    emit(PhotosStateLoaded([], null, photos));
  }

  void favorit(boal) {
    final mystate = state as PhotosStateLoaded;
    var favorite = mystate.favorites;
    favorite.add(boal);

    emit(PhotosStateLoaded(mystate.photos, mystate.factss, favorite));
    _photosProvider.saveValue(favorite);
  }

  void deleteFavorit(int i) {
    final myState = state as PhotosStateLoaded;
    var removeFavorite = myState.favorites;
    removeFavorite.removeAt(i);
    emit(PhotosStateLoaded(myState.photos, myState.factss, removeFavorite));
    _photosProvider.saveValue(removeFavorite);
  }
}
