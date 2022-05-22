

import 'package:appclei/presentation/icons_clei_icons.dart';
import 'package:appclei/src/models/publicacionModel.dart';
import 'package:appclei/src/providers/publicacion_provider.dart';
import 'package:flutter/material.dart';

import 'notice_page.dart';
import 'noticia.dart';

class StudioPage extends StatelessWidget {
 

  Noticia miNoticia = Noticia.i("", "",
      "https://avalos.sv/wp-content/uploads/default-featured-image.png");
final publicacionProvider = PublicacionProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child:  Column(children: [],)),
      appBar: AppBar(
        actions: [
          IconButton(
                iconSize: 40,
                icon: const Icon(
                  Icons.add_box_rounded,
                  color:Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '+');
                },
              )
          
        ],
        title: const Text(
          'Inicio',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Crear Publicacion',
              fontSize: 30),
        ),
        leading: IconButton(
          icon: const Icon(IconsClei.flecha),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),);
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
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, num) {
                Noticia miNoti = Noticia.i(publicacion[num].titulo,
                    publicacion[num].descripcion, publicacion[num].fotoUrl.split("+imag+")[0]);
                return Container( child: Text(publicacion[num].titulo),);
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




}
