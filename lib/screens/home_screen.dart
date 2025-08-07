import 'package:flutter/material.dart';
import 'nuevo_turno_screen.dart';
import '../models/turno.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Turno> _turnos = [];

  void _agregarTurno(Turno nuevoTurno) {
    setState(() {
      _turnos.add(nuevoTurno);
    });
  }

  // 👇 Función para determinar el color del turno
  Color _obtenerColorTurno(DateTime fechaHora) {
    final ahora = DateTime.now();

    if (fechaHora.isBefore(DateTime(ahora.year, ahora.month, ahora.day))) {
      return Colors.grey.shade400; // Pasado
    } else if (fechaHora.year == ahora.year &&
        fechaHora.month == ahora.month &&
        fechaHora.day == ahora.day) {
      return Colors.blue.shade100; // Hoy
    } else {
      return Colors.green.shade100; // Futuro
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda Médica'),
      ),
      body: _turnos.isEmpty
          ? const Center(child: Text('No hay turnos cargados'))
          : ListView.builder(
              itemCount: _turnos.length,
              itemBuilder: (context, index) {
                final turno = _turnos[index];
                final color = _obtenerColorTurno(turno.fechaHora); // 👈 nuevo

                return Card(
                  color: color,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    title: Text(turno.paciente),
                    subtitle: Text(
                      'Fecha: ${turno.fechaHora.day}/${turno.fechaHora.month}/${turno.fechaHora.year} - '
                      'Hora: ${turno.fechaHora.hour.toString().padLeft(2, '0')}:${turno.fechaHora.minute.toString().padLeft(2, '0')}',
                    ),
                    leading: const Icon(Icons.calendar_today),
                    onTap: () {
                      // Aquí podés ir a la ficha clínica o detalle del turno
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
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












