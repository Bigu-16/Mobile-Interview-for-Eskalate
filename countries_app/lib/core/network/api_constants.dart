class ApiConstants {
  static const String baseUrl = 'https://restcountries.com/v3.1';
  static const String allCountries =
      '$baseUrl/independent?status=true&fields=name,population,flag,area,region,subregion,timezones';
}
