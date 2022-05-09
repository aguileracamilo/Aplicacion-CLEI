import 'package:appclei/presentation/colors_clei.dart';
import 'package:appclei/presentation/icons_clei_icons.dart';
import 'package:appclei/src/Entidades/Publicacion.dart';
import 'package:appclei/src/Page/inicio_page.dart';
import 'package:appclei/src/Page/noticia.dart';
import 'package:appclei/src/Page/visualizacion_page.dart';
import 'package:appclei/src/models/publicacionModel.dart';
import 'package:appclei/src/providers/publicacion_provider.dart';
import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
  Noticia miNoticia = Noticia.i("", "",
      "https://avalos.sv/wp-content/uploads/default-featured-image.png");
  final publicacionProvider = new PublicacionProvider();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: appBarNoticias(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            //color: Colors.red,
            height: 80,
            width: 200,
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Container(
                  //color: Colors.black,
                  width: 300,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Noticias",
                      style: TextStyle(
                          color: ColorsCLei.azulOscuro,
                          fontSize: 30,
                          fontFamily: 'relaway'),
                    ),
                  ),
                ),
                Container(
                  //color: Colors.green,
                  child: Row(
                    children: [
                      Container(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Todas",
                            style: TextStyle(
                                color: ColorsCLei.azulOscuro,
                                fontSize: 20,
                                fontFamily: 'relaway'),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        //color: Colors.green,
                        width: 20,
                        child: Image(
                          image: AssetImage('assets/next.png'),
                          color: ColorsCLei.azulOscuro,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            //color: Colors.green,
            height: 300,
            child: _crearListado(),
          ),
          Container(
            //color: Colors.red,
            height: 50,
            width: 200,
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Container(
                  //color: Colors.black,
                  width: 300,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Actividades CLEI",
                      style: TextStyle(
                          color: ColorsCLei.azulOscuro,
                          fontSize: 30,
                          fontFamily: 'relaway'),
                    ),
                  ),
                ),
                Container(
                  //color: Colors.green,
                  child: Row(
                    children: [
                      Container(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Todas",
                            style: TextStyle(
                                color: ColorsCLei.azulOscuro,
                                fontSize: 20,
                                fontFamily: 'relaway'),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        //color: Colors.green,
                        width: 20,
                        child: Image(
                          image: AssetImage('assets/next.png'),
                          color: ColorsCLei.azulOscuro,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 300,
            child: _crearListado(),
          ),
        ],
      ),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
        future: publicacionProvider.cargarPublicacion(),
        builder: (BuildContext context,
            AsyncSnapshot<List<PublicacionModel>> snapshot) {
          if (snapshot.hasData) {
            print('aaaaaaaaaaaa');
            final publicacion = snapshot.data;
            int num = publicacion!.length;
            return ListView.builder(
              itemCount: num,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, num) {
                Noticia miNoti = Noticia.i(publicacion[num].titulo,
                    publicacion[num].descripcion, publicacion[num].fotoUrl);
                return crearNoticia(miNoti);
              },
            ); /*ListView.builder(
              itemCount: publicacion!.length,
              /*itemBuilder: (BuildContext context, int index) =>
                  _crearItem(publicacion[index]),*/
              itemBuilder: (context,num ) {
                return ListTile(
                  title: Text(publicacion[num].titulo),
                );
              },
            );*/
          } else {
            print('aaaaaaaaaaaa');
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _crearItem(PublicacionModel publicacion) {
    miNoticia.descripcion = publicacion.id;
    return Container();
  }

  AppBar appBarNoticias() {
    return AppBar(
        title: Text(
          'Inicio',
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
            icon: Icon(
              IconsClei.buscar,
              color: ColorsCLei.azulOscuro,
            ),
            onPressed: () {},
          )
        ]);
  }
}

class crearNoticia extends StatelessWidget {
  Noticia miNoticia = Noticia.i("", "", "");

  crearNoticia(Noticia miNoticia) {
    this.miNoticia = miNoticia;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      child: GestureDetector(
        onTap: () {
          Map<String,String> map = {
            'titulo': miNoticia.titulo,
            'descripcion': miNoticia.descripcion,
            'imagenUrl': miNoticia.imagenUrl
          };
          Navigator.pushNamed(context, '-', arguments: map);
        },
        child: Stack(
          children: [
            Container(
              //color: Colors.red,
              child: Image(
                image: Image.network('${miNoticia.getImagen()}').image,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 150),
              color: Colors.white,
              height: 150,
            ),
            Container(
              margin:
                  EdgeInsets.only(top: 100, bottom: 60, left: 40, right: 40),
              width: 220,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(color: Colors.grey)),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text(
                  miNoticia.getTitulo(),
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: 230, bottom: 20, left: 40, right: 40),
              color: Colors.white,
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Text(
                  miNoticia.getDescripcion(),
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 11),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
