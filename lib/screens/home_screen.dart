import 'package:flutter/material.dart';
import 'nuevo_turno_screen.dart'; // asegúrate de importar la pantalla

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agenda Médica')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Nuevo Turno'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NuevoTurnoScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}



