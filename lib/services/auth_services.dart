import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static const String baseUrl = "http://localhost:8093";
  static const salt = "privateSecretHash";
  static const headers = {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*'
  };

  static Future<void> createAccount(String userId, String pass) async {
    const apiUrl = baseUrl + "/qfd/createAccount";

    var hash = Hmac(sha256, utf8.encode(salt)).convert(utf8.encode(pass)).toString();
    http.Response res = await http.post(Uri.parse(apiUrl), headers: headers,
      body: jsonEncode(<String, String>{
        'userId': userId,
        'pass': hash
      })
    );
    print("STATUS " + res.statusCode.toString());
  }

  static Future<String> logIn(String userId, String pass) async {
    const apiUrl = baseUrl + "/qfd/logIn";

    var hash = Hmac(sha256, utf8.encode(salt)).convert(utf8.encode(pass)).toString();
    try {
      http.Response res = await http.post(Uri.parse(apiUrl), headers: headers,
          body: jsonEncode(<String, String>{
            'userName': userId,
            'pass': hash
          })
      );
      Map<String, dynamic> resBody = json.decode(res.body);

      print(res.statusCode);

      return resBody["token"];
    } catch (e) {
      print(e);
      return "";
    }
  }

  static Future<Map<String, dynamic>> getData(String token) async {
    var apiUrl = baseUrl + "/qfd/userData?token=" + token;

    try {
      http.Response res = await http.get(Uri.parse(apiUrl), headers: headers);
      Map<String, dynamic> resBody = json.decode(res.body);

      print(res.statusCode);
      print(resBody["providerInfo"]);

      return resBody;
    } catch (e) {
      print(e);
      Map<String, dynamic> errorMap = new Map<String, dynamic>();
      errorMap["error"] = e;

      return errorMap;
    }
  }
}