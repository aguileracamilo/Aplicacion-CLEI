import 'package:appclei/src/Page/crear_page.dart';
import 'package:appclei/src/Page/fav_page.dart';
import 'package:appclei/src/Page/login_page.dart';
import 'package:appclei/src/Page/inicio_page.dart';
import 'package:appclei/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:appclei/responsive_framework.dart';



void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
     builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
    routes: getApplicationRoutes(),
    );
  }
}
