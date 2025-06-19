import 'package:countries_app/features/countries/domain/entities/country.dart';
import 'package:countries_app/features/countries/domain/repositories/country_repository.dart';

class GetAllCountries {
  final CountryRepository repository;

  GetAllCountries(this.repository);

  Future<List<Country>> call() {
    return repository.getAllCountries();
  }
}