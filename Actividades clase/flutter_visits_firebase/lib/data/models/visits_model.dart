import 'package:flutter_visits_firebase/domain/entities/visits.dart';

class VisitModel {
  final String id;
  final String nombreVisitante;
  final String emailVisitante;
  final String motivoVisita;
  final String fechaVisita;
  final String horaIniVisita;
  final String horaFinVisita;

  VisitModel(
      {required this.id,
      required this.nombreVisitante,
      required this.emailVisitante,
      required this.motivoVisita,
      required this.fechaVisita,
      required this.horaIniVisita,
      required this.horaFinVisita});

  factory VisitModel.fromJson(Map<String, dynamic> json, String id) {
    return VisitModel(
      id: id,
      nombreVisitante: json['nombreVisitante'],
      emailVisitante: json['emailVisitante'],
      motivoVisita: json['motivoVisita'],
      fechaVisita: json['fechaVisita'],
      horaIniVisita: json['horaIniVisita'],
      horaFinVisita: json['horaFinVisita'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombreVisitante': nombreVisitante,
      'emailVisitante': emailVisitante,
      'motivoVisita': motivoVisita,
      'fechaVisita': fechaVisita,
      'horaIniVisita': horaIniVisita,
      'horaFinVisita': horaFinVisita
    };
  }

  VisitEntity toEntity() {
    return VisitEntity(
        id: id,
        nombreVisitante: nombreVisitante,
        emailVisitante: emailVisitante,
        motivoVisita: motivoVisita,
        fechaVisita: fechaVisita,
        horaIniVisita: horaIniVisita,
        horaFinVisita: horaFinVisita
    );
  }

  static VisitModel fromEntity(VisitEntity visit) {
    return VisitModel(
        id: visit.id,
        nombreVisitante: visit.nombreVisitante,
        emailVisitante: visit.emailVisitante,
        motivoVisita: visit.motivoVisita,
        fechaVisita: visit.fechaVisita,
        horaIniVisita: visit.horaIniVisita,
        horaFinVisita: visit.horaFinVisita);
  }
}
