import 'dart:convert';
import 'package:flutter_covid_tracker/model/all_countries_model.dart';
import 'package:flutter_covid_tracker/model/global_model.dart';
import 'package:flutter_covid_tracker/model/home_country_model.dart';
import 'package:http/http.dart' as http;

class NetworkApi{

  Future<GlobalData> getGlobalData() async {
    String url = 'https://coronavirus-19-api.herokuapp.com/all';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return GlobalData.fromJSON(json.decode(response.body));
    } else {
      throw Exception("Failed to load Post");
    }
  }

  Future<HomeCountryModel> getHomeCountryData(String countryName) async {
    String url =
        'https://coronavirus-19-api.herokuapp.com/countries/$countryName';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return HomeCountryModel.fromJSON(json.decode(response.body));
    } else {
      throw Exception("Failed to load Post");
    }
  }

  Future<CountryDataList> getAllCountriesData() async {
    String url = 'https://coronavirus-19-api.herokuapp.com/countries';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonRes = json.decode(response.body);
      return CountryDataList.fromJson(jsonRes);
    } else {
      throw Exception("Failed due to Network Error");
    }
  }

}