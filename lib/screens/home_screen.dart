import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'nuevo_turno_screen.dart';
import '../models/turno.dart';
import 'detalle_turno_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Turno> _turnos = [];

  @override
  void initState() {
    super.initState();
    _cargarTurnos();
  }

  Future<void> _cargarTurnos() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('turnos') ?? [];
    setState(() {
      _turnos = data.map((e) => Turno.fromJson(jsonDecode(e))).toList();
    });
  }

  Future<void> _guardarTurnos() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _turnos.map((t) => jsonEncode(t.toJson())).toList();
    await prefs.setStringList('turnos', data);
  }

  void _agregarTurno(Turno nuevoTurno) {
    setState(() {
      _turnos.add(nuevoTurno);
    });
    _guardarTurnos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda Médica'),
        backgroundColor: const Color(0xFF3A86FF),
        foregroundColor: Colors.white,
      ),
      body: _turnos.isEmpty
          ? const Center(
              child: Text('No hay turnos cargados'),
            )
          : ListView.builder(
              itemCount: _turnos.length,
              itemBuilder: (context, index) {
                final turno = _turnos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(turno.paciente),
                    subtitle: Text('Fecha: ${turno.fecha} - Hora: ${turno.hora}'),
                    leading: const Icon(Icons.calendar_today),
                    trailing: const Icon(Icons.chevron_right),
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












