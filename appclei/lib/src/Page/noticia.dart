

class Noticia {

  String titulo = "";
  String descripcion = "";
  String imagenUrl = "https://avalos.sv/wp-content/uploads/default-featured-image.png";

  Noticia ( this.titulo, this.descripcion);

  Noticia.i ( this.titulo, this.descripcion, this.imagenUrl);

  void setTitulo(String titulo){
    this.titulo = titulo;
  }
  void setDescripcion(String descripcion){
    this.descripcion = descripcion;
  }

  String getTitulo(){
    return titulo;
  }

  String getImagen(){
    return imagenUrl;
  }

  String getDescripcion(){
    return descripcion;
  }
}