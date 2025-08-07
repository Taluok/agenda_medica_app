import 'package:flutter/material.dart';
import '../models/turno.dart';

class FichaClinicaScreen extends StatefulWidget {
  final Turno turno;

  const FichaClinicaScreen({super.key, required this.turno});

  @override
  State<FichaClinicaScreen> createState() => _FichaClinicaScreenState();
}

class _FichaClinicaScreenState extends State<FichaClinicaScreen> {
  late TextEditingController dniController;
  late TextEditingController especialidadController;
  late TextEditingController alergiasController;
  late TextEditingController antecedentesController;
  late TextEditingController tratamientosController;
  late TextEditingController observacionesController;

  @override
  void initState() {
    super.initState();
    dniController = TextEditingController(text: widget.turno.dni ?? '');
    especialidadController = TextEditingController(text: widget.turno.especialidad ?? '');
    alergiasController = TextEditingController(text: widget.turno.alergias ?? '');
    antecedentesController = TextEditingController(text: widget.turno.antecedentes ?? '');
    tratamientosController = TextEditingController(text: widget.turno.tratamientos ?? '');
    observacionesController = TextEditingController(text: widget.turno.observaciones ?? '');
  }

  @override
  void dispose() {
    dniController.dispose();
    especialidadController.dispose();
    alergiasController.dispose();
    antecedentesController.dispose();
    tratamientosController.dispose();
    observacionesController.dispose();
    super.dispose();
  }

  void _guardarFicha() {
    setState(() {
      widget.turno.dni = dniController.text;
      widget.turno.especialidad = especialidadController.text;
      widget.turno.alergias = alergiasController.text;
      widget.turno.antecedentes = antecedentesController.text;
      widget.turno.tratamientos = tratamientosController.text;
      widget.turno.observaciones = observacionesController.text;
    });
    Navigator.pop(context, widget.turno);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ficha Clínica'),
        backgroundColor: const Color(0xFF3A86FF),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _guardarFicha,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildTextField('DNI', dniController),
            _buildTextField('Especialidad', especialidadController),
            _buildTextField('Alergias', alergiasController),
            _buildTextField('Antecedentes médicos', antecedentesController),
            _buildTextField('Tratamientos', tratamientosController),
            _buildTextField('Observaciones', observacionesController, maxLines: 4),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _guardarFicha,
              icon: const Icon(Icons.save),
              label: const Text('Guardar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3A86FF),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
