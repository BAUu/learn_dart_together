import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/orm_240326/photos.dart';

class PhotosApi {
  final urlBase = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Photos>> getPhotos(int albumId) async {
    final response = await http.get(Uri.parse(urlBase));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Photos.fromJson(e)).toList();
    } else {
      throw Exception('실패');
    }
  }
}
