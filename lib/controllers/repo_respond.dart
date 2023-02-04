import 'dart:convert';
import 'package:devaldaporto/controllers/quotes_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RRespond {
  final _baseUrl = 'https://zenquotes.io/api/quotes/';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      // const CircularProgressIndicator();
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Blog> blog = it.map((e) => Blog.fromJson(e)).toList();
        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
