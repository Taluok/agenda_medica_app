import 'package:flutter/material.dart';

class TurnoCard extends StatelessWidget {
  final String paciente;
  final String fecha;

  const TurnoCard({
    super.key,
    required this.paciente,
    required this.fecha,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: const Icon(Icons.calendar_today),
        title: Text(paciente),
        subtitle: Text(fecha),
      ),
    );
  }
}

