import 'package:asistencia_app/bloc/ganado/ganado_bloc.dart';
import 'package:asistencia_app/comp/DropDownFormField.dart';
import 'package:asistencia_app/modelo/GanadoModelo.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyFormEdit extends StatefulWidget {
  GanadoxModelo modelA;

  CompanyFormEdit({super.key, required this.modelA});

  @override
  GanadoFormEditState createState() => GanadoFormEditState(modelA: modelA);
}

class GanadoFormEditState extends State<CompanyFormEdit> {
  GanadoxModelo modelA;
  GanadoFormEditState({required this.modelA}) : super();

  late String arete = "";
  late String nombre = "";
  late String fechanac = "";
  late String foto_url = "";
  late String genero = "";
  late int razaId = 0;
  late int fincaId = 0;
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
    fechanac = valor;
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
  void capturaFinca(valor) {
    fincaId = valor;
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
                        capturaArete, modelA.arete, "Nombre arete:"),
                    _buildDatoCadena(capturaNombre, modelA.nombre,
                        "Nombre :"),
                    _buildDatoCadena(capturaFechanac,modelA.fechaNac,"fechanac:"),
                    _buildDatoCadena(capturaFoto_url, modelA.fotoUrl, "foto_url:"),
                    _buildDatoLista(capturaGenero, modelA.genero, "genero:", generos),
                    //_buildDatoCadena(capturaRaza, modelA.userId as String, "Usuario:"),
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
                                mp.fechaNac = fechanac;
                                mp.fotoUrl = foto_url;
                                mp.genero = genero;
                                mp.razaId= modelA.razaId.id;
                                mp.fincaId= modelA.fincaId.id;
                                mp.id = modelA.id;

                                /*var api = await Provider.of<GanadoApi>(
                                    context,
                                    listen: false)
                                    .updateGanado(TokenUtil.TOKEN,modelA.id.toInt(), mp);
                                print("ver: ${api.toJson()}");
                                if (api.toJson()!=null) {
                                  Navigator.pop(context, () {
                                    setState(() {});
                                  });
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
                                }*/
                                BlocProvider.of<GanadoBloc>(context)
                                    .add(UpdateGanadoEvent(mp));
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
