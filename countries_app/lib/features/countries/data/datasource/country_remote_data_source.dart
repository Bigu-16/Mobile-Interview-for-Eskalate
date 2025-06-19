import 'dart:convert';

import 'package:countries_app/core/network/api_constants.dart';
import 'package:countries_app/features/countries/data/model/country_model.dart';
import 'package:http/http.dart' as http;

abstract class CountryRemoteDataSource {
  Future<List<CountryModel>> fetchCountries();
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  final http.Client client;

  CountryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CountryModel>> fetchCountries() async {
    final response = await client.get(
      Uri.parse(ApiConstants.allCountries),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> decoded = json.decode(response.body);
      return decoded.map((json) => CountryModel.fromJson(json)).toList();
    } else {
      print(
        'Failed to load countries: ${response.statusCode} ${response.body}',
      );
      throw Exception('Failed to load countries');
    }
  }
}
