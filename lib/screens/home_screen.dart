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

  void _agregarTurno(Turno nuevoTurno) {
    setState(() {
      _turnos.add(nuevoTurno);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text('Agenda Médica'),
        backgroundColor: const Color(0xFF3A86FF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: _turnos.isEmpty
            ? const Center(child: Text('No hay turnos cargados'))
            : ListView.builder(
                itemCount: _turnos.length,
                itemBuilder: (context, index) {
                  final turno = _turnos[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 3,
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.blueAccent),
                      title: Text(turno.paciente, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('📅 ${turno.fecha} - ⏰ ${turno.hora}'),
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
        backgroundColor: const Color(0xFF3A86FF),
        child: const Icon(Icons.add),
      ),
    );
  }
}









