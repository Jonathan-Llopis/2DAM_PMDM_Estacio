import 'package:dartz/dartz.dart';
import 'package:flutter_visits_firebase/core/failure.dart';
import 'package:flutter_visits_firebase/core/usecase.dart';
import 'package:flutter_visits_firebase/domain/repositories/visits_repository.dart';



class DeleteVisit implements UseCase<void, String> {
  final VisitRepository repository;

  DeleteVisit(this.repository);

  @override
  Future<Either<Failure, void>> call(String visitId) {
    return repository.deleteVisit(visitId);
  }
}