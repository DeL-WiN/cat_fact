import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:untitled3/models/photos/photos.dart';

class ApiPhotos {
  ApiPhotos();
  final client = HttpClient();
  Future<List<Photos>> getPost() async {
    final url = Uri.parse('https://api.thecatapi.com/v1/images/search?limit=50&page=100&order=DESC');
     Options(
        headers: {"x-api-key": "be9c2a35-39c4-4901-a611-8adcbe7c9de1"},);
    // final url = Uri(scheme: 'https', host: 'jsonplaceholder.typicode.com', path: 'posts' );
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as List<dynamic>;
    final posts = json.map((dynamic e) => Photos.fromJson(e as Map<String, dynamic>)).toList();
    print(posts.length);
    return posts;
  }

}