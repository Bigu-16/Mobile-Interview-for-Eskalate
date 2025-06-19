// domain/repositories/country_repository.dart


import 'package:countries_app/features/countries/domain/entities/country.dart';

abstract class CountryRepository {
  Future<List<Country>> getAllCountries();
}
