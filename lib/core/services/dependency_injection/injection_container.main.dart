part of 'injection_container.dart';

GetIt sl = GetIt.instance;

/// Asynchronous function setting up dependency injection
Future<void> setupServiceLocator() async {
  //External
  await _externalInit();
  //Services
  await _servicesInit();
  //Feature - OnBoarding
  await _onBoardingInit();

}

Future<void> _externalInit() async {
  final preferences = await SharedPreferences.getInstance();
  //Dio
  sl.registerLazySingleton(Dio.new);
  //Internet connection checker plus
  sl.registerSingleton(InternetConnection());
  //Shared Preferences
  sl.registerSingleton<SharedPreferences>(
    preferences,
  );
  // //FirebaseAuth
  // sl.registerLazySingleton(() => FirebaseAuth.instance);
  // //FirebaseStorage
  // sl.registerLazySingleton(() => FirebaseStorage.instance);
  // //FirebaseFirestore
  // sl.registerLazySingleton(() => FirebaseFirestore.instance);
}

Future<void> _servicesInit() async {
  //NetworkInfo
  // sl.registerLazySingleton<NetworkInfo>(
  //       () => NetworkInfoImpl(internetConnectionChecker: sl()),
  // );
}

Future<void> _onBoardingInit() async {
  //Bloc
  sl.registerFactory(
        () => OnBoardingBloc(
      cacheFirstTimer: sl(),
      checkIfFirstTimer: sl(),
    ),
  );
  //UseCase
  sl.registerLazySingleton(
        () => CacheFirstTimer(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
        () => CheckIfFirstTimer(
      repository: sl(),
    ),
  );
  //Repository
  sl.registerLazySingleton<OnBoardingRepository>(
        () => OnBoardingRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  //DataSource
  sl.registerLazySingleton<OnBoardingLocalDataSource>(
        () => OnBoardingLocalDataSourceImpl(
      preferences: sl(),
    ),
  );
}