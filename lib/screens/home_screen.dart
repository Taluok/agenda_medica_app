import 'package:flutter/material.dart';
import '../models/turno.dart';
import 'nuevo_turno_screen.dart';
import 'detalle_turno_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Turno> _turnos = [];

  final Map<String, Color> especialidadColor = {
    'General': Colors.blue.shade100,
    'Cardiología': Colors.red.shade100,
    'Dermatología': Colors.green.shade100,
    'Pediatría': Colors.purple.shade100,
  };

  void _agregarTurno(Turno nuevoTurno) {
    setState(() {
      _turnos.add(nuevoTurno);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: const Text('Agenda de Turnos'),
        backgroundColor: const Color(0xFF3A86FF),
        foregroundColor: Colors.white,
      ),
      body: _turnos.isEmpty
          ? const Center(
              child: Text(
                'No hay turnos cargados',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _turnos.length,
              itemBuilder: (context, index) {
                final turno = _turnos[index];
                final color = especialidadColor[turno.especialidad] ?? Colors.grey.shade200;
                return Card(
                  color: color,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.black54),
                    ),
                    title: Text(
                      turno.paciente,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('📅 ${turno.fecha}'),
                        Text('⏰ ${turno.hora}'),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalleTurnoScreen(turno: turno),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3A86FF),
        onPressed: () async {
          final Turno? resultado = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NuevoTurnoScreen()),
          );
          if (resultado != null) {
            _agregarTurno(resultado);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}










