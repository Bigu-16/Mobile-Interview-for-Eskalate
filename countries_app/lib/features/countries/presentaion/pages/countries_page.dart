import 'package:countries_app/dependency_injection/di.dart';
import 'package:countries_app/features/countries/presentaion/blocs/country_bloc.dart';
import 'package:countries_app/features/countries/presentaion/blocs/country_event.dart';
import 'package:countries_app/features/countries/presentaion/blocs/country_state.dart';
import 'package:countries_app/features/countries/presentaion/widgets/country_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CountryBloc(sl())..add(LoadCountries()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Countries',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              height: 23 / 18,
              letterSpacing: 0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF2F2F5),
                  hintText: 'Search for a country',
                  hintStyle: const TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 24 / 16,
                    letterSpacing: 0,
                  ),
                  prefixIcon: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.search_rounded, color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 12,
                  ),
                ),
                onChanged: (query) {
                  context.read<CountryBloc>().add(SearchCountries(query));
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<CountryBloc, CountryState>(
                builder: (context, state) {
                  if (state is CountryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CountryLoaded) {
                    return ListView.builder(
                      itemCount: state.countries.length,
                      itemBuilder: (context, index) {
                        return CountryCard(country: state.countries[index]);
                      },
                    );
                  } else if (state is CountryError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: 390,
          height: 75,
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: const Border(
              top: BorderSide(width: 1, color: Color(0xFFE0E0E0)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.home),
                      iconSize: 32,
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      iconSize: 32,
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
