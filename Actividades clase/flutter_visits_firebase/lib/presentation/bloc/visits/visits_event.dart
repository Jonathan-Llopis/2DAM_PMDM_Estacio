import 'package:flutter_visits_firebase/domain/entities/visits.dart';

abstract class VisitEvent {}

/// Evento para cargar todas las tareas desde la base de datos.
class LoadVisitsEvent extends VisitEvent {
  final String? filterMotivo;

  LoadVisitsEvent(this.filterMotivo);
}

class StreamVisitsEvent extends VisitEvent {}

/// Evento para agregar una nueva tarea.
class AddVisitEvent extends VisitEvent {
  final VisitEntity visit;

  AddVisitEvent(this.visit);
}

/// Evento para actualizar una tarea existente.
class UpdateVisitEvent extends VisitEvent {
  final VisitEntity visit;

  UpdateVisitEvent(this.visit);
}

/// Evento para eliminar una tarea por su ID.
class DeleteVisitEvent extends VisitEvent {
  final String visitId;

  DeleteVisitEvent(this.visitId);
}

class GetVisitByIdEvent extends VisitEvent {
  final String visitId;

  GetVisitByIdEvent(this.visitId);
}
