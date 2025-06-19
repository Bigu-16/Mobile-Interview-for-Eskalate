import 'package:countries_app/features/countries/domain/entities/country.dart';
import 'package:countries_app/features/countries/presentaion/blocs/fav/fav_bloc.dart';
import 'package:countries_app/features/countries/presentaion/blocs/fav/fav_event.dart';
import 'package:countries_app/features/countries/presentaion/blocs/fav/fav_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(
                  'Favorites',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, state) {
                  if (state.favorites.isEmpty) {
                    return const Center(child: Text('No favorites yet.'));
                  }
                  return ListView.builder(
                    itemCount: state.favorites.length,
                    itemBuilder: (context, index) {
                      final country = state.favorites[index];
                      return ListTile(
                        leading:
                            country.flag.startsWith('http')
                                ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    country.flag,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                : Text(
                                  country.flag,
                                  style: const TextStyle(fontSize: 32),
                                ),
                        title: Text(country.name),
                        subtitle: Text(
                          'Region: ${country.region}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.favorite, color: Colors.red),
                          onPressed: () {
                            context.read<FavoritesBloc>().add(
                              RemoveFavorite(country),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.black,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
