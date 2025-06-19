import 'package:countries_app/features/countries/domain/entities/country.dart';
import 'package:countries_app/features/countries/presentaion/blocs/fav/fav_bloc.dart';
import 'package:countries_app/features/countries/presentaion/blocs/fav/fav_event.dart';
import 'package:countries_app/features/countries/presentaion/pages/country_detail_page.dart';
import 'package:countries_app/features/countries/presentaion/pages/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryCard extends StatelessWidget {
  final Country country;

  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(country.flag, style: const TextStyle(fontSize: 28)),
      title: Text(country.name),
      subtitle: Text('Population: ${_formatPopulation(country.population)}'),
      trailing: IconButton(
        icon: const Icon(Icons.favorite_border),
        onPressed: () {
          context.read<FavoritesBloc>().add(AddFavorite(country));
          // Do NOT navigate here!
        },
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CountryDetailPage(country: country),
          ),
        );
      },
    );
  }

  String _formatPopulation(int population) {
    if (population >= 1000000000) {
      return '${(population / 1000000000).toStringAsFixed(1)}B';
    } else if (population >= 1000000) {
      return '${(population / 1000000).toStringAsFixed(1)}M';
    } else {
      return population.toString();
    }
  }
}
