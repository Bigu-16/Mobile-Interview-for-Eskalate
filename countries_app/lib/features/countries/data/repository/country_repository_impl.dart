// data/repositories/country_repository_impl.dart

import 'package:countries_app/features/countries/data/datasource/country_remote_data_source.dart';

import '../../domain/entities/country.dart';
import '../../domain/repositories/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource remoteDataSource;

  CountryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Country>> getAllCountries() async {
    final models = await remoteDataSource.fetchCountries();
    return models.map((model) => model.toEntity()).toList();
  }
}
