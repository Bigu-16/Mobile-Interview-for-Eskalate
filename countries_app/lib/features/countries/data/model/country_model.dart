import '../../domain/entities/country.dart';

class CountryModel {
  final String name;
  final String flag;
  final double area;
  final String region;
  final String subregion;
  final int population;
  final List<String> timezones;

  CountryModel({
    required this.name,
    required this.flag,
    required this.area,
    required this.region,
    required this.subregion,
    required this.population,
    required this.timezones,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']?['common'] ?? 'Unknown',
      flag: json['flag'] ?? '',
      area: (json['area'] as num?)?.toDouble() ?? 0.0,
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
      population: json['population'] ?? 0,
      timezones: List<String>.from(json['timezones'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': {'common': name},
      'flag': flag,
      'area': area,
      'region': region,
      'subregion': subregion,
      'population': population,
      'timezones': timezones,
    };
  }

  /// Convert to domain entity
  Country toEntity() {
    return Country(
      name: name,
      flag: flag,
      area: area,
      region: region,
      subregion: subregion,
      population: population,
      timezones: timezones,
    );
  }

  /// Optional: Construct from entity (for local caching)
  factory CountryModel.fromEntity(Country country) {
    return CountryModel(
      name: country.name,
      flag: country.flag,
      area: country.area,
      region: country.region,
      subregion: country.subregion,
      population: country.population,
      timezones: country.timezones,
    );
  }
}
