import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/provider_model.dart';

class DataServices {
  String baseUrl = "http://127.0.0.1:5000";

  Future<List<ProviderModel>> getInfo() async {
    const apiUrl = "http://127.0.0.1:5000/providers";
    http.Response res = await http.get(Uri.parse(apiUrl), headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    });

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);

        return list.map((e) => ProviderModel.fromJson(e)).toList();
      }

      return <ProviderModel>[];
    } catch (e) {
      print(e);
      return <ProviderModel>[];
    }
  }
}