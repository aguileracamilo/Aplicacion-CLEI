import 'dart:io';

import 'package:appclei/presentation/icons_clei_icons.dart';
import 'package:appclei/src/models/publicacionModel.dart';
import 'package:appclei/src/providers/publicacion_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:image_picker/image_picker.dart';

class CrearPage extends StatefulWidget {
  @override
  State<CrearPage> createState() => _CrearPageState();
}

class _CrearPageState extends State<CrearPage> {
  final formKey = GlobalKey<FormState>();
  final publicacionProvider = PublicacionProvider();
  PublicacionModel publicacion = PublicacionModel(
      id: "", titulo: "", descripcion: "", tipo: "", fotoUrl: "");

  List<String> _status = ["Noticia", "Actividad"];

  final String _singleValue = "Text alignment right";
  String _verticalGroupValue = "Pending";
  bool _value = false;

  String _selectedGender = 'male';
  Color _color = Colors.white;

  late File? image = null;

  List _img = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconsClei.flecha),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: 20,
                ),
                //CREACION DEL TITULO
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue),
                    color: Colors.white,
                  ),
                  child: _crearTitulo(),
                ),
                //AGREGAR IMAGENES
                Container(
                  margin: EdgeInsets.only(right: 25, left: 25),
                  child: Text('Imagenes de portada'),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, top: 20),
                  height: 120,
                  //color: Colors.green,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                              onTap: () {
                                _seleccinarFoto();
                                setState(() {
                                  _color == Colors.yellow
                                      ? _color = Colors.white
                                      : _color = Colors.yellow;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                ),
                                child: Image(
                                  image: AssetImage('assets/default.png'),
                                ),
                              )),
                          Container(
                            width: 40,
                            child: Image(image: AssetImage('assets/mas.png')),
                          ),
                        ],
                      ),
                      Container(
                        width: 5,
                      ),
                      for (var i in _img) i,
                      
                    ],
                  ),
                ),
                //CREACION DE LA DESCRIPCIÓN

                _crearDescripcion(),
               
                Container(
                  margin: EdgeInsets.only(right: 25, left: 25),
                  child: Text('Tipo de publicación'),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 250,
                    height: 40,
                    //color: Colors.green,
                    child: _radioboton(),
                  ),
                ),
                _botonPublicar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _crearDescripcion() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(10),
        border: Border.all(color: Colors.blue),
        color: Colors.white,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          onSaved: (value) => publicacion.descripcion = value!,
          validator: (value) {
            if (value!.length < 2) {
              return 'Ingrese una descripcion mas larga';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Descripción',
          ),
        ),
      ),
    );
  }

  Container _crearTitulo() {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          onSaved: (value) => publicacion.titulo = value!,
          validator: (value) {
            if (value!.length < 2) {
              return 'Ingrese un titulo mas largo';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Titulo',
          ),
        ));
  }

  Row _radioboton() {
    return Row(
      children: [
        RadioGroup<String>.builder(
          direction: Axis.horizontal,
          groupValue: _verticalGroupValue,
          horizontalAlignment: MainAxisAlignment.spaceAround,
          onChanged: (value) => setState(() {
            _verticalGroupValue = value!;
            publicacion.tipo = value;
          }),
          items: _status,
          textStyle: TextStyle(fontSize: 15, color: Colors.blue),
          itemBuilder: (item) => RadioButtonBuilder(
            item,
          ),
        ),
      ],
    );
  }

  Widget _botonPublicar() {
    return ElevatedButton(
      child: const Text('Publicar'),
      onPressed: _submit,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
      ),
    );
  }

  void _submit() async {
    
    formKey.currentState?.validate();

    formKey.currentState?.save();


    setState((){});
    if(image!=null){
     publicacion.fotoUrl =(await publicacionProvider.subirImagen(image!))!;
  
    }

    publicacionProvider.crearPublicacion(publicacion);
  }

  



  void _seleccinarFoto() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);


       if (this.image != null) {
      Image a = Image.file(
        this.image!,
        width: 160,
        height: 160,
      );
      this._img.add(a);
      this._img.add(Container(
            width: 40,
          ));
    }
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }
}
