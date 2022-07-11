
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/details/details.dart';

class UserProvider {
  final sharedPreferences = SharedPreferences.getInstance();

  Future<UserDetalils> loadCash() async {
    final list = (await sharedPreferences).getStringList('list');

    final name = list?[0];
    final photo = list?[1];
    final mail = list?[2];

    final object =
    UserDetalils(displaiyName: name, email: mail, photoUrl: photo);

    print(object.displaiyName);
    // print(object.email);
    // print(object.photoUrl);
    // print('1');
    // (await sharedPreferences).remove('list');
    return object;
  }

  saveCash(UserDetalils user) async {
    final name = user.displaiyName ?? '';
    final photo = user.photoUrl ?? '';
    final mail = user.email ?? '';
    final list = [photo, name, mail];
    print(list);
    print('2');
    (await sharedPreferences).setStringList('list', list);
    final out = (await sharedPreferences).getStringList('list');
    print(out);
  }
}
class UserP  extends ChangeNotifier {
   UserProvider? _user;
  UserProvider? get user => _user;
  setUser(UserProvider user) {
    _user = user;
    notifyListeners();
  }
}