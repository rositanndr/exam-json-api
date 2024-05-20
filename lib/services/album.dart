import 'dart:convert';

import 'package:exam2/models/user.dart';
import 'package:http/http.dart' as http;

class AlbumServices {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/albums/1/photos';
  static Future<List<Album>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> result = jsonDecode(response.body);

        List<Album> albums = 
        result.map((albumjson) => Album.fromJson(albumjson)).toList();

        return albums;
      } else {
        throw Exception('failed to load albums');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}