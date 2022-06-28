import 'package:appclei/src/Page/crear_page.dart';
import 'package:appclei/src/Page/fav_page.dart';
import 'package:appclei/src/Page/login_page.dart';
import 'package:appclei/src/Page/notice_page.dart';
import 'package:appclei/src/Page/publicaciones_studio.dart';
import 'package:appclei/src/Page/visualizacion_page.dart';
import 'package:appclei/src/plantillas/navegacion.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
   // '#': (BuildContext context) => NoticePage(),


    //'-':(BuildContext context)=>InicioPage(),
    '.': (BuildContext context) => const EstructuraNavegacion(),
    '+': (BuildContext context) => const CrearPage(),
    '-': (BuildContext context) => const VisualisacionPage(),

    
  };
}
