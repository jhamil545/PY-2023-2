// ignore_for_file: library_private_types_in_public_api

import 'package:asistencia_app/bloc/ganado/ganado_bloc.dart';
import 'package:asistencia_app/comp/DropDownFormField.dart';
import 'package:asistencia_app/modelo/GanadoModelo.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class GanadoForm extends StatefulWidget {
  const GanadoForm({super.key});

  @override
  _GanadoFormState createState() => _GanadoFormState();
}

class _GanadoFormState extends State<GanadoForm> {
  late String arete = "";
  late String nombre = "";
  late String fechanac = "";
  late String foto_url = "";
  late String genero = "";
  late int razaId ;
  List<Map<String, String>> generos = [
    {'value': 'H', 'display': 'Hembra'},
    {'value': 'M', 'display': 'Macho'}
  ];
  @override

  void initState() {
    super.initState();
    print("ver: ${generos.map((item) => item['value']).toList()}");
    print("verv: ${generos.map((item) => item['display']).toList()}");
  }

  final _formKey = GlobalKey<FormState>();
  GroupController controller = GroupController();
  GroupController multipleCheckController = GroupController(
    isMultipleSelection: true,
  );


  TextEditingController _fechanac = new TextEditingController();
  DateTime? selectedDate;
  void capturaArete(valor) {
    arete = valor;
  }

  void capturaNombre(valor) {
    nombre = valor;
  }

  void capturaFechanac(valor) {
    _fechanac.text = valor;
  }

  void capturaFoto_url(valor) {
    foto_url = valor;
  }

  void capturaGenero(valor) {
    genero = valor;
  }

  void capturaRaza(valor) {
    razaId = valor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Form. Reg. Ganado B"),
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
                        capturaArete, "Nombre arete:"),
                    _buildDatoCadena(capturaNombre,
                        "Nombre :"),
                    _buildDatoFecha(
                        capturaFechanac,"fechanac:"),
                    _buildDatoCadena(capturaFoto_url, "foto_url:"),
                    _buildDatoLista(capturaGenero,genero, "Genero:", generos),
                    _buildDatoEntero(capturaRaza,  "Raza:"),
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
                                GanadoModelo mp = GanadoModelo.unlaunched();
                                mp.arete = arete;
                                mp.nombre = nombre;
                                mp.fechanac = DateFormat('yyyy-MM-dd').format(DateTime.parse(_fechanac.value.text)); ;
                                mp.foto_url = foto_url;
                                mp.genero = genero;
                                mp.razaId = razaId;
                                print("NA:$arete"
                                    "F:$nombre HI:${_fechanac.text} "
                                    "La: $foto_url, Lo:$genero "
                                    "EV:$razaId");
                                BlocProvider.of<GanadoBloc>(context)
                                    .add(CreateGanadoEvent(mp));
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

  Future<void> _selectDate(BuildContext context, Function obtValor) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        obtValor(selectedDate.toString());
      });
    }
  }

  Widget _buildDatoLista(Function obtValor,_dato, String label, List<dynamic> listaDato) {
    return DropDownFormField(
      titleText: label,
      hintText: 'Seleccione',
      value: _dato,
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

  Widget _buildDatoFecha(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      controller: _fechanac,
      keyboardType: TextInputType.datetime,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Nombre Requerido!';
        }
        return null;
      },
      onTap: (){
        _selectDate(context,obtValor);
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

}
