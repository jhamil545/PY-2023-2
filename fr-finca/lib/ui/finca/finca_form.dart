// ignore_for_file: library_private_types_in_public_api

import 'package:asistencia_app/bloc/finca/finca_bloc.dart';
import 'package:asistencia_app/comp/DropDownFormField.dart';
import 'package:asistencia_app/modelo/FincaModelo.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FincaForm extends StatefulWidget {
  const FincaForm({super.key});

  @override
  _FincaFormState createState() => _FincaFormState();
}

class _FincaFormState extends State<FincaForm> {
  late String nombre = "";
  late String nomCort = "";
  late String direccion = "";
  late String descripcion = "";
  late String ubigeo = "";
  late String ttalHectareas = "";
  late int empresaId;

  @override

  void initState() {
    super.initState();

  }

  final _formKey = GlobalKey<FormState>();
  GroupController controller = GroupController();
  GroupController multipleCheckController = GroupController(
    isMultipleSelection: true,
  );



  void capturaNombre(valor) {
    nombre = valor;
  }

  void capturaNomCort(valor) {
    nomCort = valor;
  }

  void capturaDireccion(valor) {
    direccion = valor;
  }

  void capturaDescripcion(valor) {
    descripcion = valor;
  }

  void capturaUbigeo(valor) {
    ubigeo = valor;
  }
  void capturaTtalHectareas(valor) {
    ttalHectareas = valor;
  }

  void capturaEmpresa(valor) {
    empresaId = valor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Form. Reg. Finca B"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(24),
              //color: AppTheme.nearlyWhite,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildDatoCadena(
                        capturaNombre, "Nombre :"),
                    _buildDatoCadena(capturaNomCort,
                        "NomCort :"),
                    _buildDatoCadena(
                        capturaDireccion,"Direccion:"),
                    _buildDatoCadena(capturaDescripcion, "Descripcion:"),
                    _buildDatoCadena(capturaUbigeo, "Ubigeo:"),
                    _buildDatoCadena(capturaTtalHectareas, "TtalHectareas:"),
                    _buildDatoEntero(capturaEmpresa,  "Empresa:"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: const Text('Cancelar')),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );
                                _formKey.currentState!.save();
                                FincaModelo mp = FincaModelo.unlaunched();
                                mp.nombre = nombre;
                                mp.nomCort = nomCort;
                                mp.direccion = direccion;
                                mp.descripcion = descripcion;
                                mp.ubigeo = ubigeo;
                                mp.ttalHectareas = ttalHectareas;
                                mp.ganadoId = empresaId;

                                BlocProvider.of<FincaBloc>(context)
                                    .add(CreateFincaEvent(mp));
                                Navigator.pop(context, () {
                                  //setState(() {});
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'No estan bien los datos de los campos!'),
                                  ),
                                );
                              }
                            },
                            child: const Text('Guardar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }

  Widget _buildDatoEntero(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Id es campo Requerido';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(int.parse(value!));
      },
    );
  }

  Widget _buildDatoCadena(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Nombre Requerido!';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }



}
