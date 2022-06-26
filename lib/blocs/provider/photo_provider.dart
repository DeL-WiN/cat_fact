import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/models/photos/photos.dart';

class PhotosProvider {
  final sharedPreferences =  SharedPreferences.getInstance();

  Future<List<Photos>> loadValue() async {
    final urls = (await sharedPreferences).getStringList('url');
    return urls?.map((e) => Photos(id: e, url: e, width: 400, height: 400)).toList() ?? [];
  }

  Future<void> saveValue(List<Photos> photo) async {
    try {final urls = photo.map((e) => e.url).toList();
    (await sharedPreferences).setStringList('url' , urls );
    } catch(error) {
      print(error);
    }

  }
}