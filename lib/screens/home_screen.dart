import 'package:flutter/material.dart';
import 'nuevo_turno_screen.dart';
import 'turno.dart';

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
                return ListTile(
                  title: Text(turno.paciente),
                  subtitle: Text('Fecha: ${turno.fecha} - Hora: ${turno.hora}'),
                  leading: const Icon(Icons.calendar_today),
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






