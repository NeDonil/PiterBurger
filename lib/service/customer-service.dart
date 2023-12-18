import 'dart:convert';

import 'package:vorstu/model/group.dart';
import 'package:vorstu/service/auth-service.dart';

import '../model/product.dart';

import 'package:http/http.dart' as http;

class CustomerService{
  late Map<String, String> headers;
  final url = "http://192.168.0.109:8080/api/customer"; // Proxy or dns

  CustomerService(){
    headers = AuthService.headers;
  }

  Future<List<Group>> getManyGroups() async {
    final response = await http
        .get(Uri.parse(url + "/groups"), headers: headers);

    if(response.statusCode == 200){
      return (jsonDecode(response.body) as List<dynamic>)
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception("Failed to load groups");
    }
  }

  Future<List<Product>> getProductsByGroupId(int groupId) async {
    final queryParams = {"id": groupId.toString()};
    final response = await http
        .get(Uri.parse(url + "/grouprod").replace(queryParameters: queryParams) , headers: headers);

    if(response.statusCode == 200){
      return (jsonDecode(response.body) as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception("Error " + response.statusCode.toString());
    }
  }
}