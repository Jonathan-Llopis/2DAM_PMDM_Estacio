import 'package:dartz/dartz.dart';
import 'package:flutter_visits_firebase/core/failure.dart';
import 'package:flutter_visits_firebase/data/datasources/visits_remote_datasource.dart';
import 'package:flutter_visits_firebase/data/models/visits_model.dart';
import 'package:flutter_visits_firebase/domain/entities/visits.dart';
import 'package:flutter_visits_firebase/domain/repositories/visits_repository.dart';

class VisitRepositoryImpl implements VisitRepository {
  final VisitRemoteDataSource remoteDataSource;

  VisitRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<VisitEntity>>> getVisits() async {
    try {
      final visitModels = await remoteDataSource.getVisits();
      final visitEntities = visitModels.map((visitModel) {
        return visitModel.toEntity();
      }).toList();
      return Right(visitEntities);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Stream<List<VisitEntity>>> streamVisits() {
    try {
      Stream<List<VisitModel>> visitModels = remoteDataSource.streamVisits();
      Stream<List<VisitEntity>> visitEntities = visitModels.map((visitModelList) {
        return visitModelList.map((visitModel) => visitModel.toEntity()).toList();
      });
      return Right(visitEntities);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, VisitEntity>> getVisitById(String visitId) async {
    try {
      final visit = await remoteDataSource.getVisitById(visitId);
      if (visit != null) return Right(visit.toEntity());
      return Left(ServerFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addVisit(VisitEntity visit) async {
    try {
      await remoteDataSource.addVisit(VisitModel.fromEntity(visit));
      return const Right(null);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateVisit(VisitEntity visit) async {
    try {
      await remoteDataSource.updateVisit(VisitModel.fromEntity(visit));
      return const Right(null);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteVisit(String visitId) async {
    try {
      await remoteDataSource.deleteVisit(visitId);
      return const Right(null);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}