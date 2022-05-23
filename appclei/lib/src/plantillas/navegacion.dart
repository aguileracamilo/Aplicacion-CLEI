
import 'package:appclei/presentation/colors_clei.dart';
import 'package:appclei/presentation/icons_clei_icons.dart';
import 'package:flutter/material.dart';

class EstructuraNavegacion extends StatefulWidget {
  static const Color colorIcono = ColorsCLei.gris;
  static const Color colorIcono2 = ColorsCLei.azulOscuro;

  const EstructuraNavegacion({Key? key}) : super(key: key);

  @override
  State<EstructuraNavegacion> createState() => _EstructuraNavegacionState();
}

class _EstructuraNavegacionState extends State<EstructuraNavegacion> {
  TextStyle estiloTexto=  const TextStyle(fontFamily: 'LiberationSans',fontSize: 17.0,height: 1.5 );

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
    
      iconSize: 30,
      items:  const [
        BottomNavigationBarItem(
          backgroundColor: ColorsCLei.grisClaro,
          icon: Icon(
            IconsClei.home,
            color: EstructuraNavegacion.colorIcono,
          ),
          label: 'Inicio',
         
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconsClei.favorito,
            color: EstructuraNavegacion.colorIcono,
          ),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconsClei.buscar,
            color: EstructuraNavegacion.colorIcono,
          ),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconsClei.info,
            color: EstructuraNavegacion.colorIcono,
          ),
          label: 'Info',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconsClei.perfil,
            color: EstructuraNavegacion.colorIcono,
            size: 5,
          ),
          label: 'Perfil',
        ),
      ],
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedLabelStyle: estiloTexto,
      selectedLabelStyle: estiloTexto,
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,

    );
  }
}
