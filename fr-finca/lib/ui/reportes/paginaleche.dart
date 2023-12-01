// nueva_pagina.dart

import 'package:asistencia_app/ui/empresa/empresa_main.dart';
import 'package:asistencia_app/ui/finca/finca_main.dart';
import 'package:asistencia_app/ui/ganado/ganado_main.dart';
import 'package:asistencia_app/ui/leche/leche_main.dart';
import 'package:asistencia_app/ui/raza/raza_main.dart';
import 'package:flutter/material.dart';



class ReporteDeLeche extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reporte de Leche'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Cuadro de reporte',
          style: TextStyle(fontSize: 20),
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
              title: Text('Leche'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainLeche(),
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

