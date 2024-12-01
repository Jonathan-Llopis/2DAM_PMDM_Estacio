class VisitEntity {
  final String id;
  final String nombreVisitante;
  final String emailVisitante;
  final String motivoVisita;
  final String fechaVisita;
  final String horaIniVisita;
  final String horaFinVisita;

  VisitEntity(
      {required this.id,
      required this.nombreVisitante,
      required this.emailVisitante,
      required this.motivoVisita,
      required this.fechaVisita,
      required this.horaIniVisita,
      required this.horaFinVisita});
}
