import 'package:flutter/material.dart';
import 'turno.dart';

class NuevoTurnoScreen extends StatefulWidget {
  const NuevoTurnoScreen({super.key});

  @override
  State<NuevoTurnoScreen> createState() => _NuevoTurnoScreenState();
}

class _NuevoTurnoScreenState extends State<NuevoTurnoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pacienteController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();

  void _guardarTurno() {
    if (_formKey.currentState!.validate()) {
      final nuevoTurno = Turno(
        paciente: _pacienteController.text,
        fecha: _fechaController.text,
        hora: _horaController.text,
      );

      Navigator.pop(context, nuevoTurno);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Turno')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _pacienteController,
                decoration: const InputDecoration(labelText: 'Nombre del paciente'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Este campo es obligatorio' : null,
              ),
              TextFormField(
                controller: _fechaController,
                decoration: const InputDecoration(labelText: 'Fecha (dd/mm/aaaa)'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Este campo es obligatorio' : null,
              ),
              TextFormField(
                controller: _horaController,
                decoration: const InputDecoration(labelText: 'Hora (HH:MM)'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Este campo es obligatorio' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _guardarTurno,
                child: const Text('Guardar Turno'),
              )
            ],
          ),
        ),
      ),
    );
  }
}




