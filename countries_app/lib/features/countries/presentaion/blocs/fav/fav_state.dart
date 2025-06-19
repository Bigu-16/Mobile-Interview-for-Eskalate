import 'package:countries_app/features/countries/domain/entities/country.dart';
import 'package:equatable/equatable.dart';

class FavoritesState extends Equatable {
  final List<Country> favorites;
  const FavoritesState(this.favorites);

  @override
  List<Object?> get props => [favorites];
}
