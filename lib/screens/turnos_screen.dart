import 'package:flutter/material.dart';

class TurnosScreen extends StatelessWidget {
  const TurnosScreen({super.key}); // 👈 Soluciona el warning

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Turnos'),
      ),
      body: const Center(
        child: Text('Listado de turnos'),
      ),
    );
  }
}

