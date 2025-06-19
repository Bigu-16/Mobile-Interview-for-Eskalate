import 'package:bloc/bloc.dart';
import 'package:countries_app/features/countries/presentaion/blocs/fav/fav_event.dart';
import 'package:countries_app/features/countries/presentaion/blocs/fav/fav_state.dart';
import 'package:equatable/equatable.dart';
import 'package:countries_app/features/countries/domain/entities/country.dart';


class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(const FavoritesState([])) {
    on<AddFavorite>((event, emit) {
      final updated = List<Country>.from(state.favorites)..add(event.country);
      emit(FavoritesState(updated));
    });
    on<RemoveFavorite>((event, emit) {
      final updated = List<Country>.from(state.favorites)
        ..removeWhere((c) => c.name == event.country.name);
      emit(FavoritesState(updated));
    });
  }
}