import 'package:flutter/material.dart';
import '../models/turno.dart';

class DetalleTurnoScreen extends StatelessWidget {
  final Turno turno;

  const DetalleTurnoScreen({super.key, required this.turno});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del Turno'),
        backgroundColor: const Color(0xFF3A86FF),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Paciente: ${turno.paciente}', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Text('DNI: ${turno.dni ?? "No informado"}'),
                Text('Fecha: ${turno.fecha}'),
                Text('Hora: ${turno.hora}'),
                Text('Especialidad: ${turno.especialidad}'),
                const SizedBox(height: 20),
                const Text('Observaciones:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(turno.observaciones ?? 'Sin observaciones'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

