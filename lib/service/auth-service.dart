import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Map<String, String> headers = {};
  static var storage = const FlutterSecureStorage();

  static void sendAuthRequest(String uri, String email, String password) async {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final credentials = stringToBase64.encode(email + ":" + password);
    final response = await http
        .get(Uri.parse(uri), headers: {
            HttpHeaders.authorizationHeader: 'Basic ' + credentials,
        }
    );

    if (response.statusCode == HttpStatus.ok) {
      updateCookie(response);
      log("success");
    }
  }

  static Future<String> loadCookie() async {
    var completer = new Completer<String>();

    if(headers['Cookie'] != null){
      completer.complete(headers['Cookie']);
    } else {
      storage.read(key: "Cookie")
          .then((value) => completer.complete(value));
    }

    return completer.future;
  }

  static Future<String> getPrincipal(String uri) async {
    final response = await http
        .get(Uri.parse(uri), headers: headers);
    return response.body;
  }

  static void updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      String cookie = (index == -1) ? rawCookie : rawCookie.substring(0, index);
      headers['Cookie'] = cookie;
      storage.write(key: "Cookie", value: cookie);
    }
  }
}
