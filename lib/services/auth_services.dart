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
    const apiUrl = "http://localhost:8093/qfd/createAccount";

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
    const apiUrl = "http://localhost:8093/qfd/logIn";

    var hash = Hmac(sha256, utf8.encode(salt)).convert(utf8.encode(pass)).toString();
    http.Response res = await http.post(Uri.parse(apiUrl), headers: headers,
        body: jsonEncode(<String, String>{
          'userName': userId,
          'pass': hash
        })
    );
    print("TOKEN" +  json.decode(res.body).toString());

    print("STATUS " + res.statusCode.toString());

    return '';
  }
}