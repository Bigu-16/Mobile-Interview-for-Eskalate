import 'package:countries_app/features/countries/data/datasource/country_remote_data_source.dart';
import 'package:countries_app/features/countries/data/repository/country_repository_impl.dart';
import 'package:countries_app/features/countries/domain/repositories/country_repository.dart';
import 'package:countries_app/features/countries/domain/usecases/get_all_countries.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance; // sl = service locator

Future<void> init() async {
  // Features - Countries

  // Use Cases
  sl.registerLazySingleton(() => GetAllCountries(sl()));

  // Repository
  sl.registerLazySingleton<CountryRepository>(
      () => CountryRepositoryImpl(remoteDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<CountryRemoteDataSource>(
      () => CountryRemoteDataSourceImpl(client: sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
}