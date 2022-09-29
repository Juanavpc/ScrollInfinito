import 'package:flutter/material.dart';

import 'package:clase_22_09_22/Models/Model_Gifs.dart';
import 'package:clase_22_09_22/Provider/Gif_Provider.dart';
import 'package:clase_22_09_22/Widgets/listGifs.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomeApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeApp> {
  late Future<List<ModelGifs>> _listadoGifs;
  int pagina = 1;

  ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    final getprovider = new GifProvider();
    _listadoGifs = getprovider.getGifs(offset: pagina);
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        pagina = pagina + 20;
        getprovider.getGifs(offset: pagina).then((value){ 
          setState(() {
            _listadoGifs.then((gifs) => gifs.addAll(value));
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _listadoGifs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              controller: _scrollController,
              crossAxisCount: 2,
              children: listGifs(snapshot.data as List<ModelGifs>),
            );
          } else {
            print(snapshot.error);
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
