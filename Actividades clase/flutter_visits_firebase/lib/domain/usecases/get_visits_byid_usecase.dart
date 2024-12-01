import 'package:dartz/dartz.dart';
import 'package:flutter_visits_firebase/core/failure.dart';
import 'package:flutter_visits_firebase/core/usecase.dart';
import 'package:flutter_visits_firebase/domain/entities/visits.dart';
import 'package:flutter_visits_firebase/domain/repositories/visits_repository.dart';


class GetVisitById implements UseCase<VisitEntity, String> {
  final VisitRepository repository;

  GetVisitById(this.repository);

  @override
  Future<Either<Failure, VisitEntity>> call(String visitId) {
    return repository.getVisitById(visitId);
  }
}