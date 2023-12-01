// ignore_for_file: library_private_types_in_public_api

import 'package:asistencia_app/bloc/leche/leche_bloc.dart';
import 'package:asistencia_app/comp/DropDownFormField.dart';
import 'package:asistencia_app/modelo/LecheModelo.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LecheForm extends StatefulWidget {
  const LecheForm({super.key});

  @override
  _LecheFormState createState() => _LecheFormState();
}

class _LecheFormState extends State<LecheForm> {
  late String fechaRec = "";
  late String cantidadLt = "";
  late String turno = "";
  late int ganadoId;
  List<Map<String, String>> horario = [
    {'value': 'Manana', 'display': 'Am'},
  {'value': 'Tarde', 'display': 'Pm'}
  ];
  @override

  void initState() {
    super.initState();
    print("ver: ${horario.map((item) => item['value']).toList()}");
    print("verv: ${horario.map((item) => item['display']).toList()}");
  }

  final _formKey = GlobalKey<FormState>();
  GroupController controller = GroupController();
  GroupController multipleCheckController = GroupController(
    isMultipleSelection: true,
  );


  TextEditingController _fechaRec = new TextEditingController();
  DateTime? selectedDate;
  void capturaFechaRec(valor) {
    _fechaRec.text = valor;
  }

  void capturaCantidadLt(valor) {
    cantidadLt = valor;
  }

  void capturaTurno(valor) {
    turno = valor;
  }


  void capturaGanado(valor) {
    ganadoId = int.parse(valor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Form. Reg. Leche B"),
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

                    _buildDatoFecha(capturaFechaRec,"fechaRec:"),
                    _buildDatoCadena(capturaCantidadLt,  "cantidadLt:"),
                    _buildDatoLista(capturaTurno,turno, "turno:", horario),
                    _buildDatoCadena(capturaGanado,  "ganado:"),
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
                                LecheModelo mp = LecheModelo.unlaunched();

                                mp.fechaRec = DateFormat('yyyy-MM-dd').format(DateTime.parse(_fechaRec.value.text));
                                mp.cantidadLt = cantidadLt;
                                mp.turno = turno;
                                mp.ganadoId = ganadoId;

                                BlocProvider.of<LecheBloc>(context)
                                    .add(CreateLecheEvent(mp));
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
      controller: _fechaRec,
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
