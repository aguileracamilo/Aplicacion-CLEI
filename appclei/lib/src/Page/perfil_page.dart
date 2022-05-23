import 'package:appclei/Login/login_controller.dart';
import 'package:appclei/presentation/colors_clei.dart';

import 'package:appclei/src/Entidades/Usuario.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerfilPage extends StatefulWidget {
  final Usuario usuario;

  // ignore: use_key_in_widget_constructors
  const PerfilPage({required this.usuario});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final controller = Get.put(LoginController());

  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    esAdmin(widget.usuario.correo);
    return Scaffold(
      appBar: appBarPerfil(isAdmin,context),
      body: Center(
        child: buildProfileView(),
      ),
    );
  }

  AppBar appBarPerfil(bool isAdmin,BuildContext context ) {
    return AppBar(
        title: const Text(
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
                icon: const Icon(
                  Icons.add_box_rounded,
                  color: ColorsCLei.azulOscuro,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'm');
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
          backgroundImage: Image.network(widget.usuario.getRutaImagen).image,
          radius: 140,
        ),
        Container(
          height: 25,
        ),
        Text(
          widget.usuario.getNombre,
          style: const TextStyle(
              color: ColorsCLei.negro, fontFamily: 'ModernSans', fontSize: 25),
        ),
        Container(
          height: 25,
        ),
        Text(
          "Correo: "+widget.usuario.getCorreo,
          style: const TextStyle(
              color: ColorsCLei.negro, fontFamily: 'ModernSans', fontSize: 18),
        ),
        const SizedBox(
          height: 100,
        ),
        ElevatedButton.icon(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ColorsCLei.azulOscuro) ,fixedSize:MaterialStateProperty.all(const Size(230, 50)) ),
          onPressed: () {
            controller.logout();
          },
          icon: const Icon(Icons.logout),
          label: const Text(
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
