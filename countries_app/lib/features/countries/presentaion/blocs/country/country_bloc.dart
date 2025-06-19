import 'package:countries_app/features/countries/domain/entities/country.dart';
import 'package:countries_app/features/countries/domain/usecases/get_all_countries.dart';
import 'package:countries_app/features/countries/presentaion/blocs/country/country_event.dart';
import 'package:countries_app/features/countries/presentaion/blocs/country/country_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetAllCountries getAllCountries;
  List<Country> _allCountries = [];

  CountryBloc(this.getAllCountries) : super(CountryInitial()) {
    on<LoadCountries>((event, emit) async {
      emit(CountryLoading());
      try {
        final countries = await getAllCountries();
        _allCountries = countries;
        emit(CountryLoaded(countries));
      } catch (e) {
        emit(CountryError('Failed to load countries'));
      }
    });

    on<SearchCountries>((event, emit) {
      final filtered =
          _allCountries
              .where(
                (country) => (country.name ?? '').toLowerCase().contains(
                  event.query.toLowerCase(),
                ),
              )
              .toList();
      emit(CountryLoaded(filtered));
    });
  }
}
