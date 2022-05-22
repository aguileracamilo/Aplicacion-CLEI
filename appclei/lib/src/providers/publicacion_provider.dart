import 'dart:convert';
import 'dart:io';
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

  Future<List<PublicacionModel>> cargarPublicacion() async {
    final url = '$_url/publicaciones.json';
    final resp = await http.get(Uri.parse(url));

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    final List<PublicacionModel> publicaciones = [];

    if (decodedData == null) return [];

    decodedData.forEach((id, prod) {
      final prodTemp = PublicacionModel.fromJson(prod);
      prodTemp.id = id;

      publicaciones.add(prodTemp);
      print(id);
    });

    print(publicaciones);

    return publicaciones;
  }
}
