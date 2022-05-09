import 'package:appclei/Login/login_controller.dart';
import 'package:appclei/presentation/colors_clei.dart';
import 'package:appclei/presentation/icons_clei_icons.dart';
import 'package:appclei/src/Entidades/Usuario.dart';
import 'package:appclei/src/Page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerfilPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  final Usuario usuario;
  bool isAdmin = false;

  PerfilPage({required this.usuario});

  @override
  Widget build(BuildContext context) {
    esAdmin(usuario.correo);
    return Scaffold(
      appBar: appBarPerfil(isAdmin,context),
      body: Center(
        child: buildProfileView(),
      ),
    );
  }

  AppBar appBarPerfil(bool isAdmin,BuildContext context ) {
    return AppBar(
        title: Text(
          'Perfil',
          style: TextStyle(
              color: ColorsCLei.azulOscuro,
              fontFamily: 'Coolvetica',
              fontSize: 30),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 65,
        elevation: 0.0,
        actions: <Widget>[
          Visibility(
              visible: isAdmin,
              child: IconButton(
                iconSize: 40,
                icon: Icon(
                  Icons.add_box_rounded,
                  color: ColorsCLei.azulOscuro,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '+');
                },
              ))
        ]);
  }

  Column buildProfileView() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 25,
        ),
        CircleAvatar(
          backgroundImage: Image.network(usuario.getRutaImagen).image,
          radius: 140,
        ),
        Container(
          height: 25,
        ),
        Text(
          usuario.getNombre,
          style: TextStyle(
              color: ColorsCLei.negro, fontFamily: 'ModernSans', fontSize: 25),
        ),
        Container(
          height: 25,
        ),
        Text(
          usuario.getCorreo,
          style: TextStyle(
              color: ColorsCLei.negro, fontFamily: 'ModernSans', fontSize: 18),
        ),
        SizedBox(
          height: 100,
        ),
        ElevatedButton.icon(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ColorsCLei.azulOscuro) ,fixedSize:MaterialStateProperty.all(Size(230, 50)) ),
          onPressed: () {
            controller.logout();
          },
          icon: Icon(Icons.logout),
          label: Text(
            'Cerrar sesión',
            style: TextStyle(
                color: Colors.white, fontFamily: 'ModernSans', fontSize: 25),
          ),
        ),
      ],
    );
  }

  void esAdmin(String correo){
    if(correo == 'appeventosuniquindio@gmail.com' || correo == 'csancheza@uqvirtual.edu.co'){
      isAdmin=true;
    }else{
      isAdmin=false;
    }
  }
}
