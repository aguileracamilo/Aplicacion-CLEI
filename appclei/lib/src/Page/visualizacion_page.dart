import 'package:appclei/presentation/colors_clei.dart';
import 'package:appclei/presentation/icons_clei_icons.dart';
import 'package:appclei/src/Entidades/Usuario.dart';
import 'package:appclei/src/Page/noticia.dart';
import 'package:appclei/src/models/comentarioModel.dart';
import 'package:appclei/src/models/favoritoModel.dart';
import 'package:appclei/src/providers/publicacion_provider.dart';

import 'package:flutter/material.dart';

class VisualisacionPage extends StatefulWidget {
  const VisualisacionPage({Key? key}) : super(key: key);

  @override
  State<VisualisacionPage> createState() => _VisualisacionPageState();
}

class _VisualisacionPageState extends State<VisualisacionPage> {
  String idNoticia = '';
  String correoUser='';
  String _comentario = '';
  late List<Widget> a;
  late ColorsCLei colorFavoritos;
  Color _color=Colors.black87;
  ComentarioModel comentarioModel =
      ComentarioModel(id: "", nombre: "qq", mensaje: "", fotoUrl: "qqq");
  FavoritoModel favoritoModel=FavoritoModel(id: "", idNoticia: "rr");
  final publicacionProvider = PublicacionProvider();

  @override
  Widget build(BuildContext context) {
    Map data = {};
    data = ModalRoute.of(context)?.settings.arguments as Map;
    final Noticia miNoticia = Noticia.i(data['titulo'], data['descripcion'],
        data['imagenUrl'].split('+imag')[0]);
    idNoticia = data['id'];
    favoritoModel.idNoticia=idNoticia;
    comentarioModel.nombre = data['nombreUser'];
    comentarioModel.fotoUrl = data['fotoUser'];
    correoUser = data['correo'].replaceAll(".", "punto").replaceAll("@", "punto");
    print(correoUser);
   
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      appBar: appBarVisualizacion(context),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [
              Image(image: Image.network(miNoticia.getImagen()).image),
              Container(
                margin: const EdgeInsets.only(top: 200),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 100, left: 40, right: 40, bottom: 100),
                  //color: Colors.red,
                  child: Text('${miNoticia.descripcion} '),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 150, left: 40, right: 40),
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
            ],
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              height: _raro(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
                color: Colors.white,
              ),
              child: TextField(
                onChanged: (valor) {
                  setState(() {
                    _comentario = valor;
                    comentarioModel.mensaje = valor;
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () {
                        comentar();
                        
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 4),
                        child: const Image(
                          image: AssetImage('assets/send.png'),
                          color: Colors.blue,
                        ),
                      )),
                  border: InputBorder.none,
                  hintText: 'Agregar un comentario',
                ),
              )),
          Center(
              child: Container(
            child: _crearListado(),
          )),
        ],
      ),
    );
  }
double _raro(){

  _crearListado2();
return 40.0;

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
              Navigator.of(context).pop();
            }),
        actions: <Widget>[
          IconButton( 
            icon:  Icon(
              IconsClei.favorito,
              color: _color,
            ),
            onPressed: () {
            
              publicacionProvider.crearFavorito(favoritoModel, correoUser);
              setState(() {
              _metodoFavorito();
                _color=Colors.blue;
              });
            },
          ),
          IconButton(
            icon: const Icon(
              IconsClei.compartir,
              color: ColorsCLei.azulOscuro,
            ),
            onPressed: () {
              setState(() {
                 _crearListado2();
              });
            },
          )
        ]);
  }

  void comentar() async {
    publicacionProvider.crearComentario(comentarioModel, idNoticia);
  }

  _metodoFavorito(){



  }

 _validarFavoritos(bool tarea) {

  print('aaaaaaa');
  print(correoUser);
     FutureBuilder(
        future: publicacionProvider.cargarFavoritos(correoUser),
        builder: (BuildContext context,
            AsyncSnapshot<List<FavoritoModel>> snapshot) {
              print(snapshot);
          if (snapshot.hasData) {
         
            final favoritos = snapshot.data;
            int num = favoritos!.length; 
            bool validacion=false;
              print('sssssss');
              if(num!=0){
               
                String idFavorito='';
                for(var favo in favoritos){
                  if(favo.idNoticia==idNoticia){
                    validacion=true;
                    idFavorito=favo.id;
                    
                  }
                  print('aaaaaaa');
                  print(favo.id+'22222');
                  print(idNoticia);
                }
                if(validacion){
                  setState(() {
                    _color=Colors.blue;
                  });
                   
                }else{
                  setState(() {
                    _color=Colors.black87;
                  });
                  
                }
                return Container();
            }else{
              return  Container();

            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

   _cargarFavoritos() {
    print('llamadoo');
    return FutureBuilder(
        future: publicacionProvider.cargarFavoritos(correoUser),
        builder: (BuildContext context,
            AsyncSnapshot<List<FavoritoModel>> snapshot) {
       
                   print('ssssssss');
                return Container();
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

                print(publicacion[num].idNoticia);
                return Container();
              },
            );}else{
              return Container();

            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  } _crearListado2() {
    
    return FutureBuilder(
        future: publicacionProvider.cargarComentario(idNoticia),
        builder: (BuildContext context,
            AsyncSnapshot<List<ComentarioModel>> snapshot) {
            print('aaaaaaaaa');
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
                return crearComentario(publicacion[num].fotoUrl,
                    publicacion[num].mensaje, publicacion[num].nombre);
              },
            );}else{
              return  Container(width:250,height: 250,child: Image(image: AssetImage('assets/mondongo.jpg'),));

            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  _crearListado() {
    return FutureBuilder(
        future: publicacionProvider.cargarComentario(idNoticia),
        builder: (BuildContext context,
            AsyncSnapshot<List<ComentarioModel>> snapshot) {
            
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
                return crearComentario(publicacion[num].fotoUrl,
                    publicacion[num].mensaje, publicacion[num].nombre);
              },
            );}else{
              return  Container(width:250,height: 250,child: Image(image: AssetImage('assets/mondongo.jpg'),));

            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
}

  Widget crearComentario(String urlA, String mensaje, String nombre) {
    // ignore: todo
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
            child: Image(
              image: NetworkImage(urlA),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            //color: Colors.pink,
            height: 20,
            child: Text(
              nombre,
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 60, bottom: 10),
            //color: Colors.pink,
            child: Text(mensaje),
          )
        ],
      ),
    );
  }
}
