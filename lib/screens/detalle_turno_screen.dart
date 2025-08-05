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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person, size: 50, color: Colors.blueAccent),
                const SizedBox(height: 10),
                Text(turno.paciente, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('📅 Fecha: ${turno.fecha}', style: const TextStyle(fontSize: 16)),
                Text('⏰ Hora: ${turno.hora}', style: const TextStyle(fontSize: 16)),
                const Divider(height: 30),
                const Text('Aquí podrías agregar la historia clínica, notas, recetas, etc.',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
