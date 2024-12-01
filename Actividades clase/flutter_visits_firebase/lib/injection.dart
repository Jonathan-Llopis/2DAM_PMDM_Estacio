import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_visits_firebase/data/datasources/firebase_auth_datasource.dart';
import 'package:flutter_visits_firebase/data/datasources/visits_remote_datasource.dart';
import 'package:flutter_visits_firebase/data/repositories/sign_in_repository_impl.dart';
import 'package:flutter_visits_firebase/data/repositories/visits_repository_impl.dart';
import 'package:flutter_visits_firebase/domain/repositories/sign_in_repository.dart';
import 'package:flutter_visits_firebase/domain/repositories/visits_repository.dart';
import 'package:flutter_visits_firebase/domain/usecases/add_visit_usecase.dart';
import 'package:flutter_visits_firebase/domain/usecases/delete_visit_usecase.dart';
import 'package:flutter_visits_firebase/domain/usecases/get_visits_byid_usecase.dart';
import 'package:flutter_visits_firebase/domain/usecases/get_visits_usecase.dart';
import 'package:flutter_visits_firebase/domain/usecases/sign_in_user_google_usecase.dart';
import 'package:flutter_visits_firebase/domain/usecases/sign_in_user_usecase.dart';
import 'package:flutter_visits_firebase/domain/usecases/sign_out_user_usecase.dart';
import 'package:flutter_visits_firebase/domain/usecases/stream_visits_usecase.dart';
import 'package:flutter_visits_firebase/domain/usecases/update_visit_usecase.dart';
import 'package:flutter_visits_firebase/presentation/bloc/auth/login_bloc.dart';
import 'package:flutter_visits_firebase/presentation/bloc/visits/visits_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_database/firebase_database.dart';

final getIt = GetIt.instance;

void injectDependencies() {
  // Firebase Realtime Database
  getIt
      .registerLazySingleton<FirebaseDatabase>(() => FirebaseDatabase.instance);

  // Data Sources
  getIt.registerLazySingleton<VisitRemoteDataSource>(
      () => VisitRemoteDataSourceImpl(getIt<FirebaseDatabase>()));

  // Repositories
  getIt.registerLazySingleton<VisitRepository>(
      () => VisitRepositoryImpl(getIt<VisitRemoteDataSource>()));

  // Use Cases
  getIt.registerLazySingleton(() => GetVisits(getIt<VisitRepository>()));
  getIt.registerLazySingleton(() => AddVisit(getIt<VisitRepository>()));
  getIt.registerLazySingleton(() => UpdateVisit(getIt<VisitRepository>()));
  getIt.registerLazySingleton(() => DeleteVisit(getIt<VisitRepository>()));
  getIt.registerLazySingleton(() => GetVisitById(getIt<VisitRepository>()));
  getIt.registerLazySingleton(() => StreamVisits(getIt<VisitRepository>()));

  // Bloc
  getIt.registerFactory(() => VisitsBloc(
        getVisits: getIt<GetVisits>(),
        addVisit: getIt<AddVisit>(),
        updateVisit: getIt<UpdateVisit>(),
        deleteVisit: getIt<DeleteVisit>(),
        getVisitById: getIt<GetVisitById>(),
        streamVisits: getIt<StreamVisits>(),
      ));

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      signInUserUseCase: getIt<SigninUserUseCase>(),
      signOutUserUseCase: getIt<SignoutUserUseCase>(),
      signInUserGoogleUseCase: getIt<SigninUserGoogleUseCase>(),
    ),
  );

  // Instancia de Firebase Auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Fuentes de datos
  getIt.registerLazySingleton<FirebaseAuthDataSource>(
    () => FirebaseAuthDataSource(auth: getIt<FirebaseAuth>()),
  );

  // Repositorios
  getIt.registerLazySingleton<SignInRepository>(
    () => SignInRepositoryImpl(getIt<FirebaseAuthDataSource>()),
  );

  // Casos de uso
  getIt.registerLazySingleton<SigninUserUseCase>(
    () => SigninUserUseCase(getIt()),
  );
  getIt.registerLazySingleton<SignoutUserUseCase>(
    () => SignoutUserUseCase(getIt()),
  );

  getIt.registerLazySingleton<SigninUserGoogleUseCase>(
    () => SigninUserGoogleUseCase(getIt()),
  );
}
