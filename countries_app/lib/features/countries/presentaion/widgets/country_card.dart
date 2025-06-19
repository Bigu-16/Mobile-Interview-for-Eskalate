import 'package:countries_app/features/countries/domain/entities/country.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final Country country;

  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        country.flag,
        style: const TextStyle(fontSize: 28),
      ),
      title: Text(country.name),
      subtitle: Text('Population: ${_formatPopulation(country.population)}'),
      trailing: IconButton(
        icon: const Icon(Icons.favorite_border),
        onPressed: () {
          // TODO: Handle add to favorites
        },
      ),
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