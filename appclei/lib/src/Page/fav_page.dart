import 'package:appclei/presentation/colors_clei.dart';
import 'package:appclei/presentation/icons_clei_icons.dart';
import 'package:flutter/material.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarFavorito(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              crearNoticia(),
              Container(
                height: 10,
              ),
              crearNoticia(),
              Container(
                height: 10,
              ),
            ],
          ),
        ));
  }

  AppBar appBarFavorito() {
    return AppBar(
        title: const Text(
          'Favoritos',
          style: TextStyle(
              color: ColorsCLei.azulOscuro,
              fontFamily: 'Coolvetica',
              fontSize: 30),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 65,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              IconsClei.buscar,
              color: ColorsCLei.azulOscuro,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              IconsClei.trespuntos,
              color: ColorsCLei.azulOscuro,
            ),
            onPressed: () {},
          )
        ]);
  }
}

class crearNoticia extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      child: Stack(
        children: [
          Container(
            color: Colors.red,
            child: const Image(
              image: AssetImage('assets/fondo.png'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 150),
            color: Colors.white,
            height: 150,
          ),
          Container(
            margin: const EdgeInsets.only(top: 100, bottom: 60, left: 40, right: 40),
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(color: Colors.grey)),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: const Text(
                'La Conferencia Latinoamericana de Informatica (CLEI) en armenia',
                style: TextStyle(fontSize: 19),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 230, bottom: 20, left: 40, right: 40),
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Text(
                'El evento anual organizado por el centro latinoamericano de estudios de Estudios de Informatica que ocurre desde 1974, de modo itinerante por los paises Latinoamericanos',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey.shade800, fontSize: 11),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
