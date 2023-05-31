import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/provider_model.dart';

class DataServices {
  static const String baseUrl = "http://localhost:8092";

  static Future<List<ProviderModel>> getInfo() async {
    const apiUrl = "http://localhost:8092/qfd/deals?providers=[]&status=available";
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