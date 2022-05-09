class Usuario {
  final String nombre;
  final String correo;
  final String rutaImagen;

  Usuario(
      {required this.nombre, required this.correo, required this.rutaImagen});

  get getNombre => this.nombre;

  get getCorreo => this.correo;

  get getRutaImagen => this.rutaImagen;
}
