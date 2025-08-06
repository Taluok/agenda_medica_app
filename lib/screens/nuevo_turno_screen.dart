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
  String _especialidad = 'General';

  final List<String> especialidades = [
    'General',
    'Cardiología',
    'Dermatología',
    'Pediatría',
    'Neurología',
  ];

  Future<void> _seleccionarFecha() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _fecha = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  Future<void> _seleccionarHora() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _hora = picked.format(context);
      });
    }
  }

  void _guardarTurno() {
    if (_formKey.currentState!.validate() && _fecha.isNotEmpty && _hora.isNotEmpty) {
      final nuevoTurno = Turno(
        paciente: _paciente,
        fecha: _fecha,
        hora: _hora,
        especialidad: _especialidad,
      );
      Navigator.pop(context, nuevoTurno);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor completá todos los campos')),
      );
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
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre del paciente'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Este campo es obligatorio' : null,
                onChanged: (value) => _paciente = value,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _fecha.isEmpty ? 'Seleccionar fecha' : 'Fecha: $_fecha',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: _seleccionarFecha,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _hora.isEmpty ? 'Seleccionar hora' : 'Hora: $_hora',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.access_time),
                    onPressed: _seleccionarHora,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Especialidad'),
                value: _especialidad,
                items: especialidades.map((esp) {
                  return DropdownMenuItem(
                    value: esp,
                    child: Text(esp),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _especialidad = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _guardarTurno,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3A86FF),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Guardar Turno'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






