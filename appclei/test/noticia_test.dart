
import 'package:appclei/src/Page/noticia.dart';
import 'package:flutter_test/flutter_test.dart';


void main(){

  test( 'crear', (){
    // ignore: unnecessary_new
    Noticia miNoticia = new Noticia( "Esto es una noticia", "Esto es una descripción");
    expect( miNoticia, isNotNull);
  });
  test( 'actualizar', (){
    // ignore: unnecessary_new
    Noticia miNoticia = new Noticia( "Esto es una noticia", "Esto es una descripción");
    miNoticia.setDescripcion( "Esta es una nueva descripción" );
    expect( miNoticia.getDescripcion(), "Esta es una nueva descripción");
  });
  test( 'borrar', (){
    // ignore: unnecessary_new
    Noticia miNoticia = new Noticia( "Esto es una noticia", "Esto es una descripción");  
    List<Noticia> noticias = [miNoticia];
    noticias.remove(miNoticia);
    expect( noticias.length, 0);
  });
  test( 'imprimir', (){
    // ignore: unnecessary_new
    Noticia miNoticia = new Noticia( "Esto es una noticia", "Esto es una descripción");
    expect( miNoticia, isNotNull);
  });
}