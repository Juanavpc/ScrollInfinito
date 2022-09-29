import 'package:flutter/material.dart';
import 'package:clase_22_09_22/Models/Model_Gifs.dart';

List<Widget> listGifs(List<ModelGifs> data) {
  List<Widget> gifs = [];

  for (var git in data) {
    gifs.add(
      Card(
        child: Column(
          children: [
            Expanded(
                child: Image.network(
              git.url,
              fit: BoxFit.fill,
            ))
          ],
        ),
      ),
    );
  }

  return gifs;
}
