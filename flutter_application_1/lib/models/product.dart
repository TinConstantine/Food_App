// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../type_screen.dart';

class Product {
  String? id;
  String? name;
  String? price;
  String? image;
  String? type;

  Product({this.id, this.name, this.price, this.image, this.type});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        type: json["type"]);
  }
}

Future<List<Product>> fetchProduct(http.Client client) async {
  final response = await client
      .get(Uri.parse("https://nghesitin-foodapp.onrender.com/product"));
  if (response.statusCode == 200) {
    Map<String, dynamic> mapRespone = json.decode(response.body);
    List<dynamic> products = mapRespone["data"];
    // List<dynamic> products = mapRespone["data"].cast<
    //     Map<String,
    //         dynamic>>(); //key "data" la mot mang. Dung cast de cast cai mang tren thang 1 cai list co dang Map<key,value>
    // print(mapRespone);
    final listOfProduct = products.map((e) => Product.fromJson(e)).toList();
    return listOfProduct;
  } else {
    throw Exception("Cannot get product from sever");
  }
}

Future<String> login(http.Client client, Map<String, String> params,
    BuildContext context) async {
  final response = await client.post(
      Uri.parse("http://localhost:3001/user/login"),
      body: jsonEncode(params),
      headers: {"Content-Type": "application/json"});
  if (response.statusCode == 200) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TypeScreen(),
        ));
    return "";
  }

  if (response.statusCode == 500) {
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    if (responseBody["message"] ==
        "Login fail Error: Wrong username or password") {
      return "Wrong user name or password";
    }
  }
  return "Connection errors";
}

Future<String> register(http.Client client, Map<String, String> params,
    BuildContext context) async {
  print(params);
  final response = await client.post(
      Uri.parse("https://nghesitin-foodapp.onrender.com/user/register"),
      body: jsonEncode(params),
      headers: {"Content-Type": "application/json"});
  print(response.statusCode);
  if (response.statusCode == 201) {
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TypeScreen(),
        ));
    return "";
  }

  if (response.statusCode == 500) {
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    if (responseBody["message"] == "Cannot register account") {
      return responseBody["validatorErrors"];
    }
  }
  return "Connection errors";
}
