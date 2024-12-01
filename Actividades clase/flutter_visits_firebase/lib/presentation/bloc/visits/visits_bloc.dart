import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visits_firebase/core/usecase.dart';
import 'package:flutter_visits_firebase/domain/entities/visits.dart';
import 'package:flutter_visits_firebase/domain/usecases/add_visit_usecase.dart';
import 'package:flutter_visits_firebase/domain/usecases/delete_visit_usecase.dart';
import 'package:flutter_visits_firebase/domain/usecases/get_visits_byid_usecase.dart';
import 'package:flutter_visits_firebase/domain/usecases/get_visits_usecase.dart';
import 'package:flutter_visits_firebase/domain/usecases/stream_visits_usecase.dart';
import 'package:flutter_visits_firebase/domain/usecases/update_visit_usecase.dart';
import 'package:flutter_visits_firebase/presentation/bloc/visits/visits_event.dart';
import 'package:flutter_visits_firebase/presentation/bloc/visits/visits_state.dart';

class VisitsBloc extends Bloc<VisitEvent, VisitsState> {
  final GetVisits getVisits;
  final AddVisit addVisit;
  final UpdateVisit updateVisit;
  final DeleteVisit deleteVisit;
  final GetVisitById getVisitById;
  final StreamVisits streamVisits;

  VisitsBloc(
      {required this.getVisits,
      required this.addVisit,
      required this.updateVisit,
      required this.deleteVisit,
      required this.getVisitById,
      required this.streamVisits})
      : super(const VisitsState()) {
    on<LoadVisitsEvent>(_onLoadVisits);
    on<StreamVisitsEvent>(_onStreamVisits);
    on<AddVisitEvent>(_onAddVisit);
    on<UpdateVisitEvent>(_onUpdateVisit);
    on<DeleteVisitEvent>(_onDeleteVisit);
    on<GetVisitByIdEvent>(_onGetVisitById);
  }

  Future<void> _onLoadVisits(
      LoadVisitsEvent event, Emitter<VisitsState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getVisits(NoParams());
    result.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            errorMessage: "Error cargando tareas")), (visits) {
      List<VisitEntity> filteredVisits = visits;
      if (event.filterMotivo != null) {
        filteredVisits = visits
            .where((visit) => visit.motivoVisita == event.filterMotivo)
            .toList();
      }
      emit(state.copyWith(isLoading: false, visits: filteredVisits, filtro: event.filterMotivo));
    });
  }

  Future<void> _onStreamVisits(
      StreamVisitsEvent event, Emitter<VisitsState> emit) async {
    await streamVisits(NoParams()).fold(
      (failure) async => state.copyWith(
        errorMessage: failure.toString(),
        isLoading: false,
      ),
      (stream) async {
        await emit.forEach<List<VisitEntity>>(
          stream,
          onData: (visits) => state.copyWith(visits: visits, isLoading: false),
          onError: (error, stackTrace) => state.copyWith(
            errorMessage: error.toString(),
            isLoading: false,
          ),
        );
      },
    );
  }

  Future<void> _onAddVisit(
      AddVisitEvent event, Emitter<VisitsState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    await addVisit(event.visit);
    add(LoadVisitsEvent(null));
  }

  Future<void> _onUpdateVisit(
      UpdateVisitEvent event, Emitter<VisitsState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    await updateVisit(event.visit);
    add(LoadVisitsEvent(null));
  }

  Future<void> _onDeleteVisit(
      DeleteVisitEvent event, Emitter<VisitsState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    await deleteVisit(event.visitId);
    add(LoadVisitsEvent(null));
  }

  Future<void> _onGetVisitById(
      GetVisitByIdEvent event, Emitter<VisitsState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getVisitById(event.visitId);
    result.fold(
      (failure) => emit(state.copyWith(
          isLoading: false, errorMessage: "Error cargando tareas")),
      (visit) => emit(state.copyWith(isLoading: false, visits: [visit])),
    );
  }
}
