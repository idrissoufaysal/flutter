import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:renteasy/Api/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/homeData.dart';
import '../models/home_models.dart';

class HomeService {
  Future<dynamic> getHomes(String api) async {
    var client = http.Client();
    var uri = Uri.parse(Api_url + api);
    try {
      var response = await client.get(uri);
      //var json = jsonDecode(response.body)['data'];

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body)['data'];
        print(json);
              return json;
              
        } else {
        throw Exception('Erreur lors de la récupération des maisons');
       }
      } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }
}
