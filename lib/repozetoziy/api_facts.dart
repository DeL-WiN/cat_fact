import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:untitled3/models/facts/fact/fact.dart';

class ApiFact {
  ApiFact();
 Future<Fact?> getHttp() async {
    try {
      var response = await Dio().get("https://catfact.ninja/fact");
      // print(response.data['data'][2]['fact']);
      // final post = json.decode(response.data);
      Map<String,dynamic> post = response.data;
      final posts = Fact.fromJson(post);
      return posts;

    } catch (e) {
      print(e);
    }
  }
}