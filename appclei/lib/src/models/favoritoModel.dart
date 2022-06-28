

import 'dart:convert';

FavoritoModel favoritoModelFromJson(String str) => FavoritoModel.fromJson(json.decode(str));

String favoritoModelToJson(FavoritoModel data) => json.encode(data.toJson());

class FavoritoModel {
    FavoritoModel({
        required this.id,
        required this.idNoticia,
        
    });

    String id;
    String idNoticia;
  

    factory FavoritoModel.fromJson(Map<String, dynamic> json) => FavoritoModel(
        id: json["id"],
        idNoticia: json["idNoticia"],
        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idNoticia":idNoticia,
      
    };
}
