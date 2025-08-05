import 'package:flutter/material.dart';
import '../models/turno.dart';

class NuevoTurnoScreen extends StatefulWidget {
  const NuevoTurnoScreen({super.key});

  @override
  State<NuevoTurnoScreen> createState() => _NuevoTurnoScreenState();
}

class _NuevoTurnoScreenState extends State<NuevoTurnoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _paciente = '';
  String _fecha = '';
  String _hora = '';

  void _guardarTurno() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final nuevoTurno = Turno(
        paciente: _paciente,
        fecha: _fecha,
        hora: _hora,
      );
      Navigator.pop(context, nuevoTurno);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Turno'),
        backgroundColor: const Color(0xFF3A86FF),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre del paciente'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Ingrese el nombre del paciente' : null,
                onSaved: (value) => _paciente = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Fecha (ej: 10/08/2025)'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Ingrese una fecha' : null,
                onSaved: (value) => _fecha = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Hora (ej: 15:30)'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Ingrese una hora' : null,
                onSaved: (value) => _hora = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _guardarTurno,
                child: const Text('Guardar Turno'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






