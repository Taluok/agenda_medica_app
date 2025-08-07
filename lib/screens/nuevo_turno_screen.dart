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
  DateTime? _fechaSeleccionada;
  TimeOfDay? _horaSeleccionada;
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
        _fechaSeleccionada = picked;
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
        _horaSeleccionada = picked;
      });
    }
  }

  void _guardarTurno() {
    if (_formKey.currentState!.validate() &&
        _fechaSeleccionada != null &&
        _horaSeleccionada != null) {
      final DateTime fechaHora = DateTime(
        _fechaSeleccionada!.year,
        _fechaSeleccionada!.month,
        _fechaSeleccionada!.day,
        _horaSeleccionada!.hour,
        _horaSeleccionada!.minute,
      );

      final nuevoTurno = Turno(
        paciente: _paciente,
        fechaHora: fechaHora,
        especialidad: _especialidad,
      );

      Navigator.pop(context, nuevoTurno);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor completá todos los campos')),
      );
    }
  }

  String _formatearFecha(DateTime fecha) {
    return '${fecha.day}/${fecha.month}/${fecha.year}';
  }

  String _formatearHora(TimeOfDay hora) {
    return hora.format(context);
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
                      _fechaSeleccionada == null
                          ? 'Seleccionar fecha'
                          : 'Fecha: ${_formatearFecha(_fechaSeleccionada!)}',
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
                      _horaSeleccionada == null
                          ? 'Seleccionar hora'
                          : 'Hora: ${_formatearHora(_horaSeleccionada!)}',
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






