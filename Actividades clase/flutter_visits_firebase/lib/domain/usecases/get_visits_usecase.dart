import 'package:dartz/dartz.dart';
import 'package:flutter_visits_firebase/core/failure.dart';
import 'package:flutter_visits_firebase/core/usecase.dart';
import 'package:flutter_visits_firebase/domain/entities/visits.dart';
import 'package:flutter_visits_firebase/domain/repositories/visits_repository.dart';



class GetVisits implements UseCase<List<VisitEntity>, NoParams> {
  final VisitRepository repository;

  GetVisits(this.repository);

  @override
  Future<Either<Failure, List<VisitEntity>>> call(NoParams params) {
    return repository.getVisits();
  }
}