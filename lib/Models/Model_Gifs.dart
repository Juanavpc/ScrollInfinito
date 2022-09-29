import 'dart:convert';

class Gifs {
  List<ModelGifs> items = [];

  Gifs();

  Gifs.fromJsonList(jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList["data"]) {
      final gif = new ModelGifs.fromJsonMap(item);
      items.add(gif);
    }
  }
}

class ModelGifs {
  late String nombre;
  late String url;

  ModelGifs(this.nombre, this.url);

  ModelGifs.fromJsonMap(Map<String, dynamic> json) {
    nombre = json["title"];
    url = json["images"]["downsized"]["url"];
  }
}
