import 'package:asistencia_app/comp/CustomAppBarX.dart';
import 'package:asistencia_app/ui/ganado/ganado_main.dart';
import 'package:asistencia_app/ui/raza/raza_main.dart';
import 'package:flutter/material.dart';
import 'package:asistencia_app/comp/CustomAppBar.dart';
import 'package:asistencia_app/theme/AppTheme.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
  Widget? screenView;
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    super.initState();
  }

  void accion() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.themeDataLight,
      //theme: AppTheme.themeData,
      darkTheme: AppTheme.themeDataDark,

      home: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Grid of Buttons'),
            centerTitle: true,
          ),
          body: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16.0),
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: [
              CustomGridItem(
                imageAsset: 'assets/imagen/man-icon.png',
                text: 'Button 1',
                onTapCallback: () {
                  // Navegar a MainGanado cuando se toca Button 1
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainGanado(),
                    ),
                  );
                },
              ),
              CustomGridItem(
                imageAsset: 'assets/imagen/woman-icon.png',
                text: 'Button 2',
                onTapCallback: () {
                  // Navegar a MainRaza cuando se toca Button 2
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainRaza(),
                    ),
                  );
                },
              ),
              // Agrega más CustomGridItem según sea necesario
            ],
          ),
        ),
      ),
    );
  }
}

class CustomGridItem extends StatelessWidget {
  final String imageAsset;
  final String text;
  final VoidCallback onTapCallback;

  const CustomGridItem({
    required this.imageAsset,
    required this.text,
    required this.onTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.7),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            offset: Offset(4, 4),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTapCallback,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageAsset,
                height: 40,
                width: 40,
              ),
              SizedBox(height: 8.0),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
