import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/model/home_country_model.dart';
import 'package:flutter_covid_tracker/network/network.dart';
import 'package:flutter_covid_tracker/widget/home_country_card.dart';
import 'package:geolocator/geolocator.dart';

class HomeCountryScreen extends StatefulWidget {
  @override
  _HomeCountryScreenState createState() => _HomeCountryScreenState();
}

class _HomeCountryScreenState extends State<HomeCountryScreen> {
  String _countryName;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  getUserLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placeMarks = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placeMark = placeMarks[0];
    String formattedAddress = '${placeMark.country}';
    _countryName = formattedAddress;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Country'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: _loading == true
            ? Center(child: CircularProgressIndicator())
            : FutureBuilder<HomeCountryModel>(
                future: NetworkApi().getHomeCountryData(_countryName),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var data = snapshot.data;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Stay Safe, Stay Home',
                        style: TextStyle(fontSize: 36),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${data.country}',
                        style: TextStyle(fontSize: 28),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          HomeCountryCard(
                            caseCount: snapshot.data.cases,
                            infoHeader: 'Total Cases',
                            tileColor: Colors.blueAccent,
                          ),
                          HomeCountryCard(
                            caseCount: snapshot.data.recovered,
                            infoHeader: 'Total Recoveries',
                            tileColor: Colors.green,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          HomeCountryCard(
                            caseCount: snapshot.data.deaths,
                            infoHeader: 'Total Deaths',
                            tileColor: Colors.redAccent,
                          ),
                          HomeCountryCard(
                            caseCount: snapshot.data.totalTests,
                            infoHeader: 'Total Tests',
                            tileColor: Colors.yellow[700],
                          ),
                        ],
                      ),
                    ],
                  );
                }),
      ),
    );
  }
}
