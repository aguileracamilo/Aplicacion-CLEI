

import 'dart:convert';

PublicacionModel publicacionModelFromJson(String str) => PublicacionModel.fromJson(json.decode(str));

String publicacionModelToJson(PublicacionModel data) => json.encode(data.toJson());

class PublicacionModel {
    PublicacionModel({
        required this.id,
        required this.titulo,
        required this.descripcion,
        required this.tipo,
        required this.fotoUrl,
    });

    String id;
    String titulo;
    String descripcion;
    String tipo;
    String fotoUrl;

    factory PublicacionModel.fromJson(Map<String, dynamic> json) => PublicacionModel(
        id: json["id"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        tipo: json["tipo"],
        fotoUrl: json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "descripcion": descripcion,
        "tipo": tipo,
        "fotoUrl": fotoUrl,
    };
}
