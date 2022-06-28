// ignore_for_file: file_names
class Usuario {
  String nombre;
  String correo;
  late final String rutaImagen;

  Usuario(
      {required this.nombre, required this.correo, required this.rutaImagen});

  get getNombre => nombre;

  get getCorreo => correo;

  get getRutaImagen => rutaImagen;

  void setNombre( String nombre ){
    this.nombre = nombre;
  }
   void setCorreo( String correo ){
    this.correo = correo;
  }
}
