// nueva_pagina.dart

import 'package:asistencia_app/modelo/FincaModelo.dart';
import 'package:asistencia_app/ui/empresa/empresa_main.dart';
import 'package:asistencia_app/ui/finca/finca_main.dart';
import 'package:asistencia_app/ui/ganado/ganado_main.dart';
import 'package:asistencia_app/ui/raza/raza_main.dart';
import 'package:asistencia_app/ui/reportes/data_service.dart';
import 'package:flutter/material.dart';



class ReporteGanado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reporte Ganado'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cuadro de reporte',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            MyDataTable(), // Agrega la tabla aquí
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.pets), // Ícono para Raza
              title: Text('Raza'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainRaza(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.pets), // Ícono para Ganado
              title: Text('Ganado'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainGanado(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.landscape), // Ícono para Finca
              title: Text('Finca'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainFinca(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.business), // Ícono para Empresa
              title: Text('Empresa'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainEmpresa(),
                  ),
                );
              },
            ),
            // Puedes agregar más ListTile con diferentes íconos según sea necesario
          ],
        ),
      ),
    );
  }
}


class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Contenido de Página 1',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class MyDataTable extends StatelessWidget {
  Future<List<FincaxModelo>> obtenerFincas() async {
    return DataService.obtenerFincasPorEmpresa(1);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FincaxModelo>>(
      future: obtenerFincas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras se está cargando la información, puedes mostrar un indicador de carga
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Si ocurre un error, puedes mostrar un mensaje de error
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Si no hay datos, puedes mostrar un mensaje indicando que no hay fincas
          return Text('No hay fincas disponibles');
        } else {
          // Si hay datos, crea la tabla con la información obtenida
          final List<FincaxModelo> fincas = snapshot.data!;
          return DataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Otras columnas')),
            ],
            rows: fincas.map((finca) {
              return DataRow(
                cells: [
                  DataCell(Text(finca.id.toString())), // Ajusta esto según la representación de tu modelo
                  DataCell(Text(finca.nombre)),
                  DataCell(Text('Otras columnas')),
                ],
              );
            }).toList(),
          );
        }
      },
    );
  }
}




class Pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Contenido de Página 2',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}




