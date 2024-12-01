import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_visits_firebase/data/models/visits_model.dart';

abstract class VisitRemoteDataSource {
  Future<List<VisitModel>> getVisits();
  Stream<List<VisitModel>> streamVisits();
  Future<VisitModel?> getVisitById(String visitId);
  Future<void> addVisit(VisitModel visit);
  Future<void> updateVisit(VisitModel visit);
  Future<void> deleteVisit(String visitId);
}

class VisitRemoteDataSourceImpl implements VisitRemoteDataSource {
  final FirebaseDatabase database;

  VisitRemoteDataSourceImpl(this.database);

  @override
  Future<List<VisitModel>> getVisits() async {
    List<VisitModel> visitsList = [];
    final snapshot = await database.ref('visits').get();
    if (snapshot.value != null) {
      final visitsMap = Map<String, dynamic>.from(snapshot.value as Map);
      return visitsMap.entries
          .map((e) =>
              VisitModel.fromJson(Map<String, dynamic>.from(e.value), e.key))
          .toList();
    }
    return visitsList;
  }

  @override
  Stream<List<VisitModel>> streamVisits() {
    List<VisitModel> visitsList = [];
    return database.ref('visits').onValue.map((event) {
      if (event.snapshot.value != null) {
        final visitsMap = Map<String, dynamic>.from(event.snapshot.value as Map);
        return visitsMap.entries
            .map((e) =>
                VisitModel.fromJson(Map<String, dynamic>.from(e.value), e.key))
            .toList();
      }
      return visitsList;
    });
  }

  @override
  Future<VisitModel?> getVisitById(String visitId) async {
    final snapshot = await database.ref('visits/$visitId').get();
    if (snapshot.exists) {
      return VisitModel.fromJson(
          Map<String, dynamic>.from(snapshot.value as Map), visitId);
    }
    return null;
  }

  @override
  Future<void> addVisit(VisitModel visit) async {
    await database.ref('visits').push().set(visit.toJson());
  }

  @override
  Future<void> updateVisit(VisitModel visit) async {
    await database.ref('visits/${visit.id}').update(visit.toJson());
  }

  @override
  Future<void> deleteVisit(String visitId) async {
    await database.ref('visits/$visitId').remove();
  }
}