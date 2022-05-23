// ignore_for_file: unnecessary_const, unnecessary_new
import 'package:appclei/Login/login_controller.dart';
import 'package:appclei/src/Entidades/Usuario.dart';
import 'package:appclei/src/Page/inicio_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  
  final controller = Get.put(LoginController());

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.googleAccount.value == null) {
        return Scaffold(
          backgroundColor: const Color(0xFFE0F1F3),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 70.0, 40.0, 15.0),
            child: _login(),
          ),
        );
      } else {
        final Usuario miUsuario = Usuario(
            nombre: controller.googleAccount.value?.displayName ?? '',
            correo: controller.googleAccount.value?.email ?? '',
            rutaImagen: controller.googleAccount.value?.photoUrl ?? '');
        return InicioPage(usuario: miUsuario,);
      }
    }); // Large
  }

  //Todo el contenido del login
  Widget _login() {
    return Column(
      children: [
        _imagenFondo(),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 600,
                  // height: double.infinity,
                  child: _boton('assets/Google.png', 'Iniciar con Google',
                      _estiloBoton(Colors.black, Colors.white), 'Google'),
                ),
                Container(
                  height: 15.0,
                ),
                SizedBox(
                  width: 600,
                  // height: double.infinity,
                  child: _boton(
                      'assets/facebook.png',
                      'Iniciar con Facebook',
                      _estiloBoton(Colors.white, const Color(0xFF495b94)),
                      'Facebook'),
                ),
                Container(
                  height: 15.0,
                ),
                SizedBox(
                    width: 600,
                    // height: double.infinity,
                    child: _boton(
                        'assets/twitter.png',
                        'Iniciar con Twitter',
                        _estiloBoton(Colors.white, const Color(0xFF03a9f4)),
                        'Twitter')),
              ],
            ),
          ),
        ),
        Container(
          height: 40.0,
        ),
        const FittedBox(
          alignment: Alignment.bottomCenter,
          fit: BoxFit.contain, // otherwise the logo will be tiny
          child: Center(
            child: Image(
              height: 100.0,
              width: 600.0,
              image: AssetImage('assets/Organizadores.png'),
            ),
          ),
        ),
      ],
    );
  }

//Imagen logo de fondo
  Widget _imagenFondo() {
    return const FittedBox(
      alignment: Alignment.topCenter,
      fit: BoxFit.contain, // otherwise the logo will be tiny
      child: Center(
        child: Image(
          height: 320.0,
          width: 600.0,
          image: AssetImage('assets/LogoPrincipal.png'),
        ),
      ),
    );
  }

//Metodo para crear botones se ingresa la ruta el nombre del boton y colores del boton
  Widget _boton(String rutaIcono, String textoBoton, ButtonStyle estiloBoton,
      String nameBoton) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            height: 50.0,
            width: 50.0,
            image: AssetImage(rutaIcono),
          ),
          Expanded(
            child: Text(
              textoBoton,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      onPressed: () {
        switch (nameBoton) {
          case 'Google':
            {
              controller.login();
            }
            break;

          case 'Facebook':
            {
              controller.login();
            }
            break;
          case 'Twitter':
            {
              controller.login();
            }
            break;

          default:
            {
              throw Exception("El boton no existe");
            }
        }
      },
      style: estiloBoton,
    );
  }

  //Metodo para indicar los colores de la letra y el fondo de un botonF
  ButtonStyle _estiloBoton(Color letra, Color fondo) {
    return ElevatedButton.styleFrom(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(13.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        textStyle: const TextStyle(fontSize: 30, fontFamily: 'ModernSans'),
        onPrimary: letra,
        primary: fondo);
  }
}
