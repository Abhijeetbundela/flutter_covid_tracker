import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/network/network.dart';
import 'package:intl/intl.dart';

import 'country_details_screen.dart';

class AllCountriesScreen extends StatefulWidget {
  @override
  _AllCountriesScreenState createState() => _AllCountriesScreenState();
}

class _AllCountriesScreenState extends State<AllCountriesScreen> {
  final formatter = NumberFormat("###,###");

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('All country'),
      ),
      body: Container(
        width: width,
        height: height,
        child: FutureBuilder(
            future: NetworkApi().getAllCountriesData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02, vertical: height * 0.02),
                    itemCount: snapshot.data.countries.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          trailing: Icon(Icons.play_arrow, size: height * 0.02),
                          title:
                              Text(snapshot.data.countries[index].countryName),
                          subtitle: Text(
                              "Cases: ${formatter.format(snapshot.data.countries[index].countryCases)}"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountryDetailsScreen(
                                        data: snapshot.data.countries[index])));
                          },
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
