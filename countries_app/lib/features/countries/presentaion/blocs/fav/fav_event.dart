import 'package:countries_app/features/countries/domain/entities/country.dart';
import 'package:equatable/equatable.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

class AddFavorite extends FavoritesEvent {
  final Country country;
  const AddFavorite(this.country);

  @override
  List<Object?> get props => [country];
}

class RemoveFavorite extends FavoritesEvent {
  final Country country;
  const RemoveFavorite(this.country);

  @override
  List<Object?> get props => [country];
}