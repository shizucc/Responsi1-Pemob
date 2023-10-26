import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsi/app/data/model/ikan_model.dart';

class IkanApiService {
  static const String baseUrl = "https://responsi1a.dalhaqq.xyz";

  Future<List<Ikan>> getAllFish() async {
    final response = await http.get(Uri.parse("$baseUrl/ikan"));
    final result = json.decode(response.body);
    List<dynamic> jsonIkans = result['data'];
    List<Ikan> ikans =
        jsonIkans.map((jsonIkan) => Ikan.fromJson(jsonIkan)).toList();
    return ikans;
  }

  Future<bool> saveIkan(Map<String, dynamic> body) async {
    final response = await http.post(Uri.parse("$baseUrl/ikan"), body: body);

    final result = json.decode(response.body);
    if (result['code'] == 200 && result['status'] == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateIkan(Map<String, dynamic> body, String id) async {
    final response = await http.put(Uri.parse("$baseUrl/ikan/$id"), body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteIkan(String id) async {
    final response = await http.delete(Uri.parse("$baseUrl/ikan/$id"));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
