import 'package:appclei/presentation/colors_clei.dart';
import 'package:appclei/presentation/icons_clei_icons.dart';
import 'package:appclei/src/Entidades/Usuario.dart';
import 'package:appclei/src/Page/noticia.dart';
import 'package:appclei/src/models/publicacionModel.dart';
import 'package:appclei/src/providers/publicacion_provider.dart';
import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget {

  Usuario usuario=Usuario(nombre: "", correo: "", rutaImagen: "");

 NoticePage({required this.usuario});

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  Noticia miNoticia = Noticia.i("", "",
      "https://avalos.sv/wp-content/uploads/default-featured-image.png");

  final publicacionProvider = PublicacionProvider();

  @override
  Widget build(BuildContext context) {
    // ignore: todo
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
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                const SizedBox(
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
                Row(
                  children: [
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Todas",
                        style: TextStyle(
                            color: ColorsCLei.azulOscuro,
                            fontSize: 20,
                            fontFamily: 'relaway'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      //color: Colors.green,
                      width: 20,
                      child: const Image(
                        image: AssetImage('assets/next.png'),
                        color: ColorsCLei.azulOscuro,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            //color: Colors.green,
            height: 300,
            child: _crearListado('Noticia'),
          ),
          Container(
            //color: Colors.red,
            height: 50,
            width: 200,
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                const SizedBox(
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
                Row(
                  children: [
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Todas",
                        style: TextStyle(
                            color: ColorsCLei.azulOscuro,
                            fontSize: 20,
                            fontFamily: 'relaway'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      //color: Colors.green,
                      width: 20,
                      child: const Image(
                        image: AssetImage('assets/next.png'),
                        color: ColorsCLei.azulOscuro,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 300,
            child: _crearListado('Actividad'),
          ),
        ],
      ),
    );
  }

  Widget _crearListado(String tipo) {
    return FutureBuilder(
        future: publicacionProvider.cargarPublicacion(),
        builder: (BuildContext context,
            AsyncSnapshot<List<PublicacionModel>> snapshot) {
          if (snapshot.hasData) {
            final publicacion = snapshot.data;
            int num = publicacion!.length;
            return ListView.builder(
              itemCount: num,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, num) {
                Noticia miNoti = Noticia.i(publicacion[num].titulo,
                    publicacion[num].descripcion, publicacion[num].fotoUrl.split("+imag+")[0]);
                return crearNoticia(miNoti,tipo==publicacion[num].tipo,publicacion[num].fotoUrl,widget.usuario,publicacion[num].id);
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
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  AppBar appBarNoticias() {
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(
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
  bool tipo=false;
  String idNoticia="";
  Usuario user=new Usuario(nombre: "", correo: "", rutaImagen: "");
  

  crearNoticia(this.miNoticia, bool t,fotos,Usuario user,String id , {Key? key}) : super(key: key) {
    tipo=t;
    this.idNoticia=id;
    this.user=user;
    

  }

  @override
  Widget build(BuildContext context) {
    if(tipo){
    return Container(margin: const EdgeInsets.all(13.0),
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      child: GestureDetector(
        onTap: () {
          print(user.correo);
          Map<String,String> map = {
            'correo':user.correo,
            'nombreUser':user.nombre,
            'fotoUser':user.rutaImagen,
             'id': idNoticia,
            'titulo': miNoticia.titulo,
            'descripcion': miNoticia.descripcion,
            'imagenUrl': miNoticia.imagenUrl
          };
          Navigator.pushNamed(context, '-', arguments: map);
        },
        child: Stack(
          children: [
            Image(
              image: Image.network(
                miNoticia.getImagen(),
              ).image,
            ),
            Container(
              margin: const EdgeInsets.only(top: 150),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400)),
              child: Container(
                margin: const EdgeInsets.only(top: 47, left: 40, right: 40),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Text( miNoticia.getDescripcion(),
                    textAlign:  TextAlign.justify,
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 11),
                  ),
                ),
              ),      
            ),
            Container(
              margin:
              const EdgeInsets.only(top: 100, bottom: 60, left: 30, right: 30),
              width: 1000,
              height: 1000,
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(color: Colors.grey)),
              child: Container(
                margin:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Center(
                  child: Text(
                    miNoticia.getTitulo(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 19
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    }
    return Container();
  }
}
