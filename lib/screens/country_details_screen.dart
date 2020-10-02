import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/model/all_countries_model.dart';
import 'package:intl/intl.dart';

class CountryDetailsScreen extends StatelessWidget {
  final CountryData data;

  CountryDetailsScreen({this.data});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: height * 0.26,
            pinned: true,
            elevation: 8.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(data.countryName),
              background: AppBarDetail(
                country: data.countryName,
                casesInfo: data.countryCases,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(children: <Widget>[
              DetailCard(
                heading: "Total Deaths",
                info: data.countryDeaths,
              ),
              DetailCard(
                heading: "Total Recoveries",
                info: int.parse(data.countryRecovered),
              ),
              DetailCard(
                heading: "Today Cases",
                info: data.todayCases,
              ),
              DetailCard(
                heading: "Today Deaths",
                info: data.todayDeaths,
              ),
              DetailCard(
                heading: "Total Tests",
                info: data.totalTests,
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  final int info;
  final String heading;

  DetailCard({this.info, this.heading});

  final formatter = NumberFormat("###,###");

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Card(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          title: Text(
            '${formatter.format(info)}',
            style: TextStyle(fontSize: height * 0.04),
          ),
          subtitle: Text(
            heading,
            style: TextStyle(fontSize: height * 0.02),
          ),
        ),
      ),
    );
  }
}

class AppBarDetail extends StatelessWidget {
  final formatter = NumberFormat("###,###");

  final String country;
  final int casesInfo;

  AppBarDetail({this.country, this.casesInfo});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Center(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Total Cases",
                    style: TextStyle(
                        fontSize: height * 0.027, color: Colors.white)),
                Text("${formatter.format(casesInfo)}",
                    style: TextStyle(
                        fontSize: height * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
