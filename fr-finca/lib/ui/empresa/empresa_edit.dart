import 'package:asistencia_app/bloc/empresa/empresa_bloc.dart';
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

class EmpresaFormEdit extends StatefulWidget {
  EmpresaModelo modelA;

  EmpresaFormEdit({required this.modelA}) : super();

  @override
  _EmpresaFormEditState createState() => _EmpresaFormEditState(modelA: modelA);
}

class _EmpresaFormEditState extends State<EmpresaFormEdit> {
  EmpresaModelo modelA;

  _EmpresaFormEditState({required this.modelA}) : super();

  late int _Id = 0;
  late  String _nombre= "";
  late  String _nomCort= "";
  late  String _direccionFiscal= "";
  late  String _ruc= "";
  late  String _ubigeo= "";

  Position? currentPosition;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

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
    getCurrentLocation();
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
                        capturaNombre, modelA.nombre, "Nombre Empresa:"),
                    _buildDatoCadena(
                        capturaNomCort, modelA.nomCort, "nomCort:"),
                    _buildDatoCadena(
                        capturaDireccionFiscal, modelA.direccionFiscal, "direccionFiscal:"),
                    _buildDatoCadena(
                        capturaRuc, modelA.ruc, "ruc:"),
                    _buildDatoCadena(
                        capturaUbigeo, modelA.ubigeo, "ubigeo:"),

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

                                final prefs =
                                    await SharedPreferences.getInstance();

                                mp.id = modelA.id;

                                print("P:${_nombre}, NA:${_nomCort},");

                                /*var api = await Provider.of<EmpresaApi>(
                                    context,
                                    listen: false)
                                    .updateEmpresa(TokenUtil.TOKEN,modelA.id.toInt(), mp);
                                print("ver: ${api.toJson()}");
                                if (api.toJson()!=null) {
                                  Navigator.pop(context, () {
                                    setState(() {});
                                  });
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
                                }*/
                                BlocProvider.of<EmpresaBloc>(context)
                                    .add(UpdateEmpresaEvent(mp));
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

  Widget _buildDatoEntero(Function obtValor, String _dato, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: _dato,
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

  Widget _buildDatoCadena(Function obtValor, String _dato, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: _dato,
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

  Future<bool> permiso() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> getCurrentLocation() async {
    final hasPermission = await permiso();
    if (!hasPermission) {
      return;
    }
    if (mounted) {
      Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best,
              forceAndroidLocationManager: true)
          .then((Position position) {
        if (mounted) {
          setState(() {
            currentPosition = position;
            //getCurrentLocationAddress();
          });
        }
      }).catchError((e) {
        print(e);
      });
    }
  }
}
