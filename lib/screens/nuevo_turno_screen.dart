import 'package:flutter/material.dart';

class NuevoTurnoScreen extends StatelessWidget {
  const NuevoTurnoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Turno'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TurnoForm(),
      ),
    );
  }
}

class TurnoForm extends StatefulWidget {
  const TurnoForm({super.key});

  @override
  State<TurnoForm> createState() => _TurnoFormState();
}

class _TurnoFormState extends State<TurnoForm> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _fechaController = TextEditingController();
  final _horaController = TextEditingController();
  final _motivoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _fechaController.dispose();
    _horaController.dispose();
    _motivoController.dispose();
    super.dispose();
  }

  void _guardarTurno() {
    if (_formKey.currentState!.validate()) {
      final nuevoTurno = {
        'nombre': _nombreController.text,
        'fecha': _fechaController.text,
        'hora': _horaController.text,
        'motivo': _motivoController.text,
      };

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Turno guardado')),
      );

      Navigator.pop(context, nuevoTurno);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            controller: _nombreController,
            decoration: const InputDecoration(labelText: 'Nombre del paciente'),
            validator: (value) =>
                value == null || value.isEmpty ? 'Campo requerido' : null,
          ),
          TextFormField(
            controller: _fechaController,
            decoration: const InputDecoration(labelText: 'Fecha'),
            validator: (value) =>
                value == null || value.isEmpty ? 'Campo requerido' : null,
          ),
          TextFormField(
            controller: _horaController,
            decoration: const InputDecoration(labelText: 'Hora'),
            validator: (value) =>
                value == null || value.isEmpty ? 'Campo requerido' : null,
          ),
          TextFormField(
            controller: _motivoController,
            decoration: const InputDecoration(labelText: 'Motivo'),
            validator: (value) =>
                value == null || value.isEmpty ? 'Campo requerido' : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _guardarTurno,
            child: const Text('Guardar turno'),
          ),
        ],
      ),
    );
  }
}

