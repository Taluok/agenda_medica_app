class Turno {
  final String paciente;
  final DateTime fechaHora;

  String? dni;
  String? especialidad;
  String? alergias;
  String? antecedentes;
  String? tratamientos;
  String? observaciones;

  Turno({
    required this.paciente,
    required this.fechaHora,
    this.dni,
    this.especialidad,
    this.alergias,
    this.antecedentes,
    this.tratamientos,
    this.observaciones,
  });
}


