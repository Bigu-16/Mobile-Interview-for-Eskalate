import 'package:countries_app/features/countries/domain/entities/country.dart';
import 'package:equatable/equatable.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object?> get props => [];
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<Country> countries;

  const CountryLoaded(this.countries);

  @override
  List<Object?> get props => [countries];
}

class CountryError extends CountryState {
  final String message;

  const CountryError(this.message);

  @override
  List<Object?> get props => [message];
}