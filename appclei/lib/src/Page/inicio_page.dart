import 'package:appclei/presentation/colors_clei.dart';
import 'package:appclei/presentation/icons_clei_icons.dart';
import 'package:appclei/src/Entidades/Usuario.dart';
import 'package:appclei/src/Page/crear_page.dart';
import 'package:appclei/src/Page/fav_page.dart';
import 'package:appclei/src/Page/notice_page.dart';
import 'package:appclei/src/Page/perfil_page.dart';
import 'package:appclei/src/Page/visualizacion_page.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatefulWidget {
  Usuario usuario;

  InicioPage({required this.usuario});
  
  @override
  State<InicioPage> createState() => _InicioPageState(miUsuario: usuario);
}

class _InicioPageState extends State<InicioPage> {
  int _selectedIndex = 0;
  Usuario user=new Usuario(nombre: "", correo:"", rutaImagen: "");
  
  Usuario miUsuario = Usuario(
      nombre: 'default', correo: 'default', rutaImagen: 'assets/default.png');

  _InicioPageState({required this.miUsuario}){
    
  }
  

  TextStyle estiloTexto =
      const TextStyle(fontFamily: 'ModernSans', fontSize: 17.0, height: 1.5);

   List<Widget> _widgetOptions() =>  [
    NoticePage(),
    FavoritosPage(),
    Text(
      'Index 2: Buscar',
    ),
    Text(
      'Pagina info',
    ),
   PerfilPage(usuario: miUsuario,),
  ];

  visualizar() {
    print('a');
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions=_widgetOptions();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            backgroundColor: ColorsCLei.grisClaro,
            icon: Icon(
              IconsClei.home,
              size: 26,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsClei.favorito,
              size: 26,
            ),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsClei.buscar,
              size: 26,
            ),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsClei.info,
              size: 26,
            ),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsClei.perfil,
              size: 26,
            ),
            label: 'Perfil',
          ),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedLabelStyle: estiloTexto,
        selectedLabelStyle: estiloTexto,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: ColorsCLei.azulOscuro,
        unselectedItemColor: ColorsCLei.gris,
        elevation: 0.0,

        //selectedFontSize: 15,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Usuario getUsuario(){
    return this.miUsuario;
  }
}
