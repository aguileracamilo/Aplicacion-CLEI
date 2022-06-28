

import 'dart:convert';

ComentarioModel comentarioModelFromJson(String str) => ComentarioModel.fromJson(json.decode(str));

String comentarioModelToJson(ComentarioModel data) => json.encode(data.toJson());

class ComentarioModel {
    ComentarioModel({
        required this.id,
        required this.nombre,
        required this.mensaje,
      
        required this.fotoUrl,
    });

    String id;
    String nombre;
    String mensaje;
    String fotoUrl;

    factory ComentarioModel.fromJson(Map<String, dynamic> json) => ComentarioModel(
        id: json["id"],
        nombre: json["nombre"],
        mensaje: json["mensaje"],
    
        fotoUrl: json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "mensaje": mensaje,
       
        "fotoUrl": fotoUrl,
    };
}
