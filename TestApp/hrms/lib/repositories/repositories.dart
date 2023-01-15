import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static String mainUrl = "http://192.168.134.192";
  var loginUrl = '$mainUrl/index.php';

  final FlutterSecureStorage storage = new FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login(String user_id, String password) async {
    var response =
        await http.post(Uri.parse("http://192.168.134.192/index.php"), body: {
      'username': user_id,
      'password': password,
    });

    // if (response.statusCode == 200) {
    //   var jsondata = json.decode(response.body);
    //   if (response.statusCode == 200) {
    //     var response2 = await http
    //         .post(Uri.parse("http://192.168.134.192/index1.php"), body: {
    //       'username': user_id,
    //     });

    //     if (response2.statusCode == 200) {
    //       var jsondata2 = json.decode(response2.body);
    //       final _MyBox = Hive.box('data');

    //       _MyBox.put("email", jsondata2['email']);
    //       _MyBox.put("token", jsondata['token']);
    //     }
    //     return jsondata['token'];
    //   } else {
    //     throw "SOMETHING WENT WRONG";
    //   }

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      var email_response = await http
          .post(Uri.parse("http://192.168.134.192/index1.php"), body: {
        'username': user_id,
      });

      if (email_response.statusCode == 200) {
        var email_response_body = json.decode(email_response.body);
        final _MyBox = Hive.box('data');

        _MyBox.put("email", email_response_body['email']);
        _MyBox.put("token", jsondata['token']);

        return jsondata['token'];
      } else {
        throw "SOMETHING WENT WRONG";
      }
    }
    return response.body;
  }
}
