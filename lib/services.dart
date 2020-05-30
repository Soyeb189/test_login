import 'dart:convert';
import 'package:http/http.dart' as http;
import 'menu.dart';

class Services {
  static Future<List<Menu>> getPhotos() async {
    try {
      final response =
      await http.get("http://192.168.43.61:8086/menu");
      if (response.statusCode == 200) {
        List<Menu> list = parsePhotos(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Parse the JSON response and return list of Album Objects //
  static List<Menu> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Menu>((json) => Menu.fromJson(json)).toList();
  }
}