
import 'package:appclei/src/Entidades/Usuario.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test( 'crear', (){
    // ignore: unnecessary_new
    Usuario miUsuario = new Usuario(nombre: "Juan", correo: "Juan@gmail.com", rutaImagen: "assets/logo.png");
    expect( miUsuario, isNotNull);
  });
  test( 'actualizar', (){
    // ignore: unnecessary_new
    Usuario miUsuario = new Usuario(nombre: "Juan", correo: "Juan@gmail.com", rutaImagen: "assets/logo.png");
    miUsuario.setNombre("pepe");
    expect( miUsuario.getNombre, "pepe");
  });
  test( 'borrar', (){
    // ignore: unnecessary_new
    Usuario miUsuario = new Usuario(nombre: "Juan", correo: "Juan@gmail.com", rutaImagen: "assets/logo.png");
    List<Usuario> usuarios = [miUsuario];
    usuarios.remove(miUsuario);
    expect( usuarios.length, 0);
  });
  test( 'imprimir', (){
    // ignore: unnecessary_new
    Usuario miUsuario = new Usuario(nombre: "Juan", correo: "Juan@gmail.com", rutaImagen: "assets/logo.png");
  
    expect(miUsuario.getNombre, "Juan");
  });
}