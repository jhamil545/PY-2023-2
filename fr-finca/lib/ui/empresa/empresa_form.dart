import 'package:asistencia_app/apis/empresa_api.dart';
import 'package:asistencia_app/bloc/empresa/empresa_bloc.dart';
import 'package:asistencia_app/comp/DropDownFormField.dart';
import 'package:asistencia_app/modelo/EmpresaModelo.dart';
import 'package:asistencia_app/theme/AppTheme.dart';
import 'package:asistencia_app/util/TokenUtil.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmpresaForm extends StatefulWidget {
  @override
  _EmpresaFormState createState() => _EmpresaFormState();
}

class _EmpresaFormState extends State<EmpresaForm> {
  late String _nombre = "";
  late  String _nomCort= "";
  late  String _direccionFiscal= "";
  late  String _ruc= "";
  late  String _ubigeo= "";

  TextEditingController _fecha = new TextEditingController();
  DateTime? selectedDate;

  TextEditingController _horai = new TextEditingController();
  TextEditingController _minToler = new TextEditingController();
  TimeOfDay? selectedTime;



  late String _userCreate;
  var _data = [];





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
    this._nombre = valor;

  }
  void capturaNomCort(valor) {
    this._nomCort = valor;

  }
  void capturaDireccionFiscal(valor) {
    this._direccionFiscal = valor;
  }
  void capturaRuc(valor) {
    this._ruc = valor;
  }
  void capturaUbigeo(valor) {
    this._ubigeo = valor;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Form. Reg. Empresa B"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(24),
              //color: AppTheme.nearlyWhite,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    _buildDatoCadena(
                        capturaNombre,  "Nombre Empresa:"),
                    _buildDatoCadena(
                        capturaNomCort,  "nomCort:"),
                    _buildDatoCadena(
                        capturaDireccionFiscal, "direccionFiscal:"),
                    _buildDatoCadena(
                        capturaRuc, "ruc:"),
                    _buildDatoCadena(
                        capturaUbigeo, "ubigeo:"),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Text('Cancelar')),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );
                                _formKey.currentState!.save();
                                EmpresaModelo mp = new EmpresaModelo.unlaunched();

                                mp.nombre = _nombre;
                                mp.nomCort = _nomCort;
                                mp.direccionFiscal = _direccionFiscal;
                                mp.ruc = _ruc;
                                mp.ubigeo = _ubigeo;
                                //print(DateFormat('yyyy-MM-dd').format(currentTime));

                                print("NA:${_nombre}");

                                /*var api = await Provider.of<EmpresaApi>(
                                    context,
                                    listen: false)
                                    .crearEmpresa(TokenUtil.TOKEN,mp);
                                print("ver: ${api.toJson()}");

                                if (api.toJson() !=null) {
                                  Navigator.pop(context, () {
                                    setState(() {});
                                  });
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
                                }*/
                                BlocProvider.of<EmpresaBloc>(context)
                                    .add(CreateEmpresaEvent(mp));
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

  Widget _buildDatoLista(
      Function obtValor, _dato, String label, List<dynamic> listaDato) {
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

  Widget _buildDatoFecha(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      controller: _fecha,
      keyboardType: TextInputType.datetime,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Nombre Requerido!';
        }
        return null;
      },
      onTap: () {
        _selectDate(context, obtValor);
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

  Future<void> _selectTime(BuildContext context, Function obtValor) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext? context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        });
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        obtValor(
            "${(selectedTime!.hour) < 10 ? "0" + (selectedTime!.hour).toString() : selectedTime!.hour}:${(selectedTime!.minute) < 10 ? "0" + (selectedTime!.minute).toString() : selectedTime!.minute}:00");
        //_horai.text="${selectedTime!.hour}:${selectedTime!.minute}";
      });
    }
  }

  Widget _buildDatoHora(Function obtValor, Function capControl, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      controller: capControl(),
      keyboardType: TextInputType.datetime,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Nombre Requerido!';
        }
        return null;
      },
      onTap: () {
        _selectTime(context, obtValor);
      },
      onSaved: (String? value) {
        obtValor(value!);
        //_horai.text=value!;
      },
    );
  }




}
