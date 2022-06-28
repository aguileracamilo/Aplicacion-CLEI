import 'dart:convert';
import 'dart:io';
import 'package:appclei/src/models/comentarioModel.dart';
import 'package:appclei/src/models/favoritoModel.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart' as http;

import 'package:appclei/src/models/publicacionModel.dart';

class PublicacionProvider {
  final String _url = 'https://pruebasignin-6dd62-default-rtdb.firebaseio.com';

  Future<bool> crearPublicacion(PublicacionModel publicacion) async {
    final url = '$_url/publicaciones.json';

    final resp = await http.post(Uri.parse(url),
        body: publicacionModelToJson(publicacion));

    final decodedData = json.decode(resp.body);

    return true;
  }

  Future<List<PublicacionModel>> cargarPublicaciones() async {
    final url = '$_url/publicaciones.json';
    final resp = await http.get(Uri.parse(url));
    // ignore: unused_local_variable
    final decodedData = json.decode(resp.body);

    return [];
  }

  Future<String?> subirImagen(File imagen) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dntd2pmgs/image/upload?upload_preset=tuo4xq9t');
    final mimeType = mime(imagen.path)?.split('/');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', imagen.path,
        contentType: MediaType(mimeType![0], mimeType[1]));

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();

    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return null;
    }
    final respData = json.decode(resp.body);

    return respData['secure_url'];
  }

  Future<int> borrarPublicacion(String id) async {
    final url = '$_url/publicaciones/$id.json';
    final resp = await http.delete(Uri.parse(url));

    return 1;
  }

  Future<List<PublicacionModel>> cargarPublicacion() async {
    final url = '$_url/publicaciones.json';
    final resp = await http.get(Uri.parse(url));

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    final List<PublicacionModel> publicaciones = [];

    // ignore: unnecessary_null_comparison
    if (decodedData == null) return [];

    decodedData.forEach((id, prod) {
      final prodTemp = PublicacionModel.fromJson(prod);
      prodTemp.id = id;

      publicaciones.add(prodTemp);
    });

    return publicaciones;
  }

   Future<bool> crearComentario(ComentarioModel comentario,String idNoticia) async {
    final url = '$_url/comentarios/$idNoticia.json';

    final resp = await http.post(Uri.parse(url),
        body: comentarioModelToJson(comentario));

    final decodedData = json.decode(resp.body);

    return true;
  }


  Future<List<ComentarioModel>> cargarComentario(String idNoticia) async {
    final url = '$_url/comentarios/$idNoticia.json';
    final resp = await http.get(Uri.parse(url));
    if(json.decode(resp.body)!=null){
    final Map<String, dynamic> decodedData = json.decode(resp.body);

    final List<ComentarioModel> comentarios = [];

    // ignore: unnecessary_null_comparison
    if (decodedData == null) return [];

    decodedData.forEach((id, prod) {
      final prodTemp = ComentarioModel.fromJson(prod);
      prodTemp.id = id;

      comentarios.add(prodTemp);
    });

    return comentarios;
    }
    return [];
    
  }
Future<bool> crearFavorito(FavoritoModel favorito,String correo) async {
    final url = '$_url/favoritos/$correo.json';

    final resp = await http.post(Uri.parse(url),
        body: favoritoModelToJson(favorito));

    final decodedData = json.decode(resp.body);

    return true;
  }
   Future<int> eliminarFavorito(String correo, String id) async {
    final url = '$_url/favoritos/$correo/$id.json';
    final resp = await http.delete(Uri.parse(url));

    return 1;
  }

  
  Future<List<FavoritoModel>> cargarFavoritos(String correo) async {
    final url = '$_url/favoritos/$correo.json';
    print(url);
    final resp = await http.get(Uri.parse(url));
    if(json.decode(resp.body)!=null){
    final Map<String, dynamic> decodedData = json.decode(resp.body);

    final List<FavoritoModel> favoritos = [];

    // ignore: unnecessary_null_comparison
    if (decodedData == null) return [];

    decodedData.forEach((id, prod) {
      final prodTemp = FavoritoModel.fromJson(prod);
      prodTemp.id = id;

      favoritos.add(prodTemp);
    });

    return favoritos;
    }
    return [];
    
  }

}
