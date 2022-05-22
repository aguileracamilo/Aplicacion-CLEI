import 'dart:io';

import 'package:appclei/presentation/icons_clei_icons.dart';
import 'package:appclei/src/models/publicacionModel.dart';
import 'package:appclei/src/providers/publicacion_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:image_picker/image_picker.dart';

class CrearPage extends StatefulWidget {
  const CrearPage({Key? key}) : super(key: key);

  @override
  State<CrearPage> createState() => _CrearPageState();
}

class _CrearPageState extends State<CrearPage> {
  final formKey = GlobalKey<FormState>();
  final publicacionProvider = PublicacionProvider();
  PublicacionModel publicacion = PublicacionModel(
      id: "", titulo: "", descripcion: "", tipo: "", fotoUrl: "");

  final List<String> _status = ["Noticia", "Actividad"];

  String _verticalGroupValue = "Noticia";

  Color _color = Colors.white;

  late File? image;
  String _titulo = "";

  final List _img = [];

  final List _imag = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inicio',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Crear Publicacion',
              fontSize: 30),
        ),
        leading: IconButton(
          icon: const Icon(IconsClei.flecha),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: 20,
                ),
                //CREACION DEL TITULO

                _crearTitulo(),

                //AGREGAR IMAGENES
                Container(
                  margin: const EdgeInsets.only(right: 25, left: 25),
                  child: const Text('Imagenes de portada',style: TextStyle(fontSize: 20),),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25, top: 20),
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
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                ),
                                child: const Image(
                                  image: AssetImage('assets/default.png'),
                                ),
                              )),
                          const SizedBox(
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
                  margin: const EdgeInsets.only(right: 25, left: 25),
                  child: const Text('Tipo de publicación',style: TextStyle(fontSize: 20),),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
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
  void _mostrarAlert(BuildContext context){

showDialog(context: context,barrierDismissible: true, builder: (context){

  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0)),
    title: const Text('Mensaje'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text('La noticia se ha publicado'),
        SizedBox(height: 150,width:150,child: Image(image:AssetImage('assets/IconoClei.png'),) ,),
       
      ],
    ),
    actions: [
      Center(child:  TextButton(onPressed: (){Navigator.of(context).pop();Navigator.of(context).pop();}, child: const Text('Aceptar')),)
     
     

    ],


  );

});

  }
  

  Container _crearDescripcion() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue),
        color: Colors.white,
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          maxLines: 10,
          onSaved: (value) => publicacion.descripcion = value!,
          validator: (value) {
            if (value!.length < 2) {
              return 'Ingrese una descripcion mas larga';
            } else {
              return null;
            }
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Descripción',
          ),
        ),
      ),
    );
  }

  Widget _crearTitulo() {
    return  Container(margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: TextField(
        
          // autofocus: true, //interesante por que abre el teclado automaticamente
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            counter: Text('Letras ${_titulo.length}'),
            hintText: 'Escriba un titulo',
            labelText: 'Titulo',
            suffixIcon: const Icon(Icons.title),
          ),
          onChanged: (valor) {
             publicacion.titulo =valor;
            setState(() {
              _titulo = valor;
            });
          },
        
      ),
    );
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
          textStyle: const TextStyle(fontSize: 15, color: Colors.blue),
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
    String a = '';
    formKey.currentState?.validate();

    formKey.currentState?.save();

    setState(() {});
    if (image != null) {
      // ignore: unused_local_variable
      for (var i in _img) {
        a = a + (await publicacionProvider.subirImagen(image!))! + '+imag+';
        publicacion.fotoUrl = a;
      }
    }

    publicacionProvider.crearPublicacion(publicacion);
    _mostrarAlert(context);
  }

  void _seleccinarFoto() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
      _imag.add(imageTemporary);

      if (this.image != null) {
        Image a = Image.file(
          this.image!,
          width: 160,
          height: 160,
        );
        _img.add(a);
        _img.add(Container(
              width: 40,
            ));
      }
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image $e');
    }
  }
}
