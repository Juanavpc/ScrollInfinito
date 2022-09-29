import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:clase_22_09_22/Models/Model_Gifs.dart';

class GifProvider {

  Future<List<ModelGifs>> getGifs({required int offset}) async {
    final url = "https://api.giphy.com/v1/gifs/trending?api_key=pAVednGJeOXUqRAR5E8Z29WPnpw8aTRr&limit=10&offset=$offset&rating=g";
    final resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonData = jsonDecode(body);
      final gifs = Gifs.fromJsonList(jsonData);
      return gifs.items;
    } else {
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }
}

