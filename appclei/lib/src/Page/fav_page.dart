import 'package:appclei/presentation/colors_clei.dart';
import 'package:appclei/presentation/icons_clei_icons.dart';
import 'package:appclei/src/Entidades/Usuario.dart';
import 'package:appclei/src/Page/noticia.dart';
import 'package:appclei/src/models/favoritoModel.dart';
import 'package:appclei/src/models/publicacionModel.dart';
import 'package:appclei/src/providers/publicacion_provider.dart';
import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  
  Usuario usuario=Usuario(nombre: "", correo: "", rutaImagen: "");

  FavoritosPage({required this.usuario});
  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {

   Noticia miNoticia = Noticia.i("", "",
      "https://avalos.sv/wp-content/uploads/default-featured-image.png");
   
String usuarioCorreo='';
  final publicacionProvider = PublicacionProvider();
  @override
  Widget build(BuildContext context) {
usuarioCorreo= widget.usuario.correo.replaceAll(".", "punto").replaceAll("@", "punto");;

    return Scaffold(
      body: Center(
          child: Container(
        child: _crearListado(),
      )),
      appBar: AppBar(
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
        ]),
    );
  }
  

   Widget _crearListado() {

    return FutureBuilder(
        future: publicacionProvider.cargarFavoritos(usuarioCorreo),
        builder: (BuildContext context,
            AsyncSnapshot<List<FavoritoModel>> snapshot) {
            
          if (snapshot.hasData) {
         
            final publicacion = snapshot.data;
            int num = publicacion!.length; 
              if(num!=0){
            return ListView.builder(
              itemCount: num,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, num) {

                

                return Container();
              },
            );}else{
              return  Container(width:250,height: 250,child: Image(image: AssetImage('assets/mondongo.jpg'),));

            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
 
 



class CrearNoticia2 extends StatefulWidget {
  Noticia miNoticia = Noticia.i("", "", "");
  String id = "";
  bool tipo = false;
String idNoticia="";
  Usuario user=new Usuario(nombre: "", correo: "", rutaImagen: "");
  CrearNoticia2(this.miNoticia, bool t, fotos, String miId,Usuario user,String id , {Key? key})
      : super(key: key) {
    tipo = t;
    id = miId;
    this.idNoticia=id;
    this.user=user;
  }

  @override
  State<CrearNoticia2> createState() => _CrearNoticia2State();
}

class _CrearNoticia2State extends State<CrearNoticia2> {
  final publicacionProvider = PublicacionProvider();

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    if (widget.tipo) {
      return Container(
        margin: const EdgeInsets.all(13.0),
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.grey)),
        child: GestureDetector(
          onTap: () {
            Map<String, String> map = {
               'nombreUser':widget.user.nombre,
            'fotoUser':widget.user.rutaImagen,
             'id': widget.idNoticia,
              'titulo': widget.miNoticia.titulo,
              'descripcion': widget.miNoticia.descripcion,
              'imagenUrl': widget.miNoticia.imagenUrl
            };
            Navigator.pushNamed(context, '-', arguments: map);
          },
          child: Stack(
            children: [
              Image(
                image: Image.network(widget.miNoticia.getImagen()).image,
              ),
              Container(
                margin: const EdgeInsets.only(top: 150),
                color: Colors.white,
                height: 150,
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 100, bottom: 60, left: 40, right: 40),
                  width: 300,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey)),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: Text(
                      widget.miNoticia.getTitulo(),
                      style: const TextStyle(fontSize: 19),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 230, bottom: 20, left: 40, right: 40),
                color: Colors.white,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    widget.miNoticia.getDescripcion(),
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
    return Container();
  }
}

