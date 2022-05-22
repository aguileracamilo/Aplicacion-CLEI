// ignore_for_file: file_names
class Usuario {
  final String nombre;
  final String correo;
  final String rutaImagen;

  Usuario(
      {required this.nombre, required this.correo, required this.rutaImagen});

  get getNombre => nombre;

  get getCorreo => correo;

  get getRutaImagen => rutaImagen;
}
