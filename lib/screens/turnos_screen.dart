import 'package:flutter/material.dart';
import '../widgets/turno_card.dart';

class TurnosScreen extends StatelessWidget {
  final List<Map<String, String>> turnos = [
    {
      'paciente': 'Juan Pérez',
      'fecha': '2025-08-01',
      'hora': '14:00',
    },
    {
      'paciente': 'María López',
      'fecha': '2025-08-02',
      'hora': '09:30',
    },
  ];

  TurnosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Turnos'),
      ),
      body: ListView.builder(
        itemCount: turnos.length,
        itemBuilder: (context, index) {
          final turno = turnos[index];
          return TurnoCard(
            paciente: turno['paciente'] ?? '',
            fecha: '${turno['fecha']} ${turno['hora']}',
          );
        },
      ),
    );
  }
}


