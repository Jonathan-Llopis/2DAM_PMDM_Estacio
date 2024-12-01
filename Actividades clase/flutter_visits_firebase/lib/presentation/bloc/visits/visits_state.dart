import 'package:equatable/equatable.dart';
import 'package:flutter_visits_firebase/domain/entities/visits.dart';

class VisitsState extends Equatable {
  final List<VisitEntity> visits;
  final String filtro;
  final bool isLoading;
  final String? errorMessage;

  const VisitsState({
    this.visits = const <VisitEntity>[],
    this.filtro = '',
    this.isLoading = false,
    this.errorMessage,
  });

  VisitsState copyWith({
    List<VisitEntity>? visits,
    String? filtro,
    bool? isLoading,
    String? errorMessage,
  }) {
    return VisitsState(
      visits: visits ?? this.visits,
      filtro: filtro ?? this.filtro,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [visits, isLoading, errorMessage, filtro];
}
