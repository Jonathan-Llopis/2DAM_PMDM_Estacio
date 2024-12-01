import 'package:dartz/dartz.dart';
import 'package:flutter_visits_firebase/core/failure.dart';
import 'package:flutter_visits_firebase/domain/entities/visits.dart';

abstract class VisitRepository {
  Future<Either<Failure, List<VisitEntity>>> getVisits();

  Either<Failure, Stream<List<VisitEntity>>> streamVisits();

  Future<Either<Failure, VisitEntity>> getVisitById(String visitId);

  Future<Either<Failure, void>> addVisit(VisitEntity visit);

  Future<Either<Failure, void>> updateVisit(VisitEntity visit);

  Future<Either<Failure, void>> deleteVisit(String visitId);
}
