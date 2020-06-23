import 'dart:convert';
import 'package:http/http.dart' as http;
import 'menu.dart';
import 'AcStatmentModel.dart';

class Services {
  static String root = "http://192.168.43.61:8086/";
  static Future<List<Menu>> getPhotos() async {
    try {
      final response = await http.get(root + "menu");
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

  static Future<List<AcStatmentModel>> getStatment() async{
    try {
      final response = await http.get(root + "ac_statments");
      if (response.statusCode == 200) {
        List<AcStatmentModel> list = parseStatment(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<AcStatmentModel> parseStatment(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<AcStatmentModel>((json) => AcStatmentModel.fromJson(json)).toList();
  }
}
