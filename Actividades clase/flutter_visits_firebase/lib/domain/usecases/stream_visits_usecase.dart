import 'package:dartz/dartz.dart';
import 'package:flutter_visits_firebase/core/failure.dart';
import 'package:flutter_visits_firebase/core/usecase.dart';
import 'package:flutter_visits_firebase/domain/entities/visits.dart';
import 'package:flutter_visits_firebase/domain/repositories/visits_repository.dart';



class StreamVisits {
  final VisitRepository repository;

  StreamVisits(this.repository);

  Either<Failure, Stream<List<VisitEntity>>> call(NoParams params) {
    return repository.streamVisits();
  }
}