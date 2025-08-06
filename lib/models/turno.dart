class Turno {
  final String paciente;
  final String fecha;
  final String hora;
  final String especialidad;
  final String? dni;
  final String? observaciones;

  Turno({
    required this.paciente,
    required this.fecha,
    required this.hora,
    required this.especialidad,
    this.dni,
    this.observaciones,
  });

  Map<String, dynamic> toJson() => {
        'paciente': paciente,
        'fecha': fecha,
        'hora': hora,
        'especialidad': especialidad,
        'dni': dni,
        'observaciones': observaciones,
      };

  factory Turno.fromJson(Map<String, dynamic> json) => Turno(
        paciente: json['paciente'],
        fecha: json['fecha'],
        hora: json['hora'],
        especialidad: json['especialidad'],
        dni: json['dni'],
        observaciones: json['observaciones'],
      );
}



