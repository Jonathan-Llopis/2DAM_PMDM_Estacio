import 'package:dartz/dartz.dart';
import 'package:flutter_visits_firebase/core/failure.dart';
import 'package:flutter_visits_firebase/core/usecase.dart';
import 'package:flutter_visits_firebase/domain/entities/visits.dart';
import 'package:flutter_visits_firebase/domain/repositories/visits_repository.dart';



class UpdateVisit implements UseCase<void, VisitEntity> {
  final VisitRepository repository;

  UpdateVisit(this.repository);

  @override
  Future<Either<Failure, void>> call(VisitEntity visit) {
    return repository.updateVisit(visit);
  }
}