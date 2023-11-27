import 'package:asistencia_app/bloc/finca/finca_bloc.dart';
import 'package:asistencia_app/comp/DropDownFormField.dart';
import 'package:asistencia_app/modelo/FincaModelo.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyFormEdit extends StatefulWidget {
  FincaxModelo modelA;

  CompanyFormEdit({super.key, required this.modelA});

  @override
  FincaFormEditState createState() => FincaFormEditState(modelA: modelA);
}

class FincaFormEditState extends State<CompanyFormEdit> {
  FincaxModelo modelA;
  FincaFormEditState({required this.modelA}) : super();

  late String nombre = "";
  late String nomCort = "";
  late String direccion = "";
  late String descripcion = "";
  late String ubigeo = "";
  late String ttalHectareas = "";
  late int empresaId=0;

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
                        capturaNombre, modelA.nombre, "Nombre :"),
                    _buildDatoCadena(capturaNomCort, modelA.nomCort,
                        "nomCort :"),
                    _buildDatoCadena(
                        capturaDireccion, modelA.direccion, "direccion:"),
                    _buildDatoCadena(capturaDescripcion, modelA.descripcion, "descripcion:"),
                    _buildDatoCadena(capturaUbigeo, modelA.ubigeo, "ubigeo:"),
                    _buildDatoCadena(capturaTtalHectareas, modelA.ttalHectareas, "ttalHectareas:"),
                    //_buildDatoCadena(capturaEmpresa, modelA.empresaId as String, "empresaId:"),
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
                                mp.empresaId= modelA.empresaId.id;
                                mp.id = modelA.id;

                                /*var api = await Provider.of<FincaApi>(
                                    context,
                                    listen: false)
                                    .updateFinca(TokenUtil.TOKEN,modelA.id.toInt(), mp);
                                print("ver: ${api.toJson()}");
                                if (api.toJson()!=null) {
                                  Navigator.pop(context, () {
                                    setState(() {});
                                  });
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
                                }*/
                                BlocProvider.of<FincaBloc>(context)
                                    .add(UpdateFincaEvent(mp));
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

  Widget _buildDatoEntero(Function obtValor, String dato, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: dato,
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

  Widget _buildDatoCadena(Function obtValor, String dato, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: dato,
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

  Widget buildDatoLista(
      Function obtValor, dato, String label, List<dynamic> listaDato) {
    return DropDownFormField(
      titleText: label,
      hintText: 'Seleccione',
      value: dato,
      onSaved: (value) {
        setState(() {
          obtValor(value);
        });
      },
      onChanged: (value) {
        setState(() {
          obtValor(value);
        });
      },
      dataSource: listaDato,
      textField: 'display',
      valueField: 'value',
    );
  }
}
