
import 'package:appclei/presentation/colors_clei.dart';
import 'package:appclei/presentation/icons_clei_icons.dart';
import 'package:appclei/src/Page/noticia.dart';
import 'package:flutter/material.dart';

class VisualisacionPage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    Map data = {};
    data = ModalRoute.of(context)?.settings.arguments as Map; 
    final Noticia miNoticia = Noticia.i(data['titulo'],  data['descripcion'],data['imagenUrl'].split('+imag')[0]);
    // TODO: implement build
    return Scaffold(
      appBar: appBarVisualizacion(context),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            //color: Colors.amber,
            child: Stack(
              children: [
                Image(width:600,height: 350,image: Image.network(miNoticia.getImagen()).image),
                Container(
                  margin: const EdgeInsets.only(top: 200),
                  height: 100,
                  //color: Colors.blue,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 150, left: 40, right: 40),
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey)),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: Text(
                      miNoticia.titulo,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: const EdgeInsets.only(
                    top: 245,
                    left: 350,
                  ),
                  //color: Colors.pink,
                  height: 20,
                  width: 80,
                  child: const Text(
                    '21/04/2022',
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 400, left: 40, right: 40),
                  //color: Colors.red,
                  child: Text(
                      '${miNoticia.descripcion} '),
                )
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    child: const Image(
                      image: AssetImage('assets/lupa.png'),
                      color: Colors.blue,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: 'Agregar un comentario',
                ),
              )),
          crearComentario(),
          crearComentario()
        ],
      ),
    );
  }

  AppBar appBarVisualizacion(BuildContext context) {
    return AppBar(
        title: const Text(
          'Inicio',
          style: TextStyle(
              color: ColorsCLei.azulOscuro,
              fontFamily: 'Coolvetica',
              fontSize: 30),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 65,
        elevation: 0.0,
        leading: IconButton(
            icon: const Icon(
              IconsClei.flecha,
              color: ColorsCLei.azulOscuro,
            ),
            onPressed: () {
              print('press');
              Navigator.of(context).pop();
            }),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              IconsClei.favorito,
              color: ColorsCLei.azulOscuro,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              IconsClei.compartir,
              color: ColorsCLei.azulOscuro,
            ),
            onPressed: () {},
          )
        ]);
  }
}

class crearComentario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      //color: Colors.purple,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            width: 40,
            height: 40,
            child: const Image(
              image: AssetImage('assets/perfil.png'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            //color: Colors.pink,
            height: 20,
            child: Text(
              'Nombre real',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 60, bottom: 10),
            //color: Colors.pink,
            child: const Text('Muy facha la publicacion'),
          )
        ],
      ),
    );
  }
}
