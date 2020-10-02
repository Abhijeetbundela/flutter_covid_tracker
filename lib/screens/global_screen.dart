import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/model/global_model.dart';
import 'package:flutter_covid_tracker/network/network.dart';
import 'package:flutter_covid_tracker/widget/global_list_tile.dart';
import 'package:intl/intl.dart';

class GlobalScreen extends StatefulWidget {
  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Global'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.01, horizontal: width * 0.02),
        width: width,
        height: height,
        child: GlobalDataList(),
      ),
    );
  }
}

class GlobalDataList extends StatelessWidget {
  final formatter = NumberFormat("###,###");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<GlobalData>(
          future: NetworkApi().getGlobalData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              int caseCount = int.parse(snapshot.data.cases);
              int deathCount = int.parse(snapshot.data.deaths);
              int recoveredCount = int.parse(snapshot.data.recovered);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Global Covid-19",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  GlobalListTile(
                      caseInfo: formatter.format(caseCount),
                      infoHeader: 'Cases',
                      tileColor: Colors.blueAccent),
                  GlobalListTile(
                    caseInfo: formatter.format(deathCount),
                    infoHeader: 'Deaths',
                    tileColor: Colors.redAccent,
                  ),
                  GlobalListTile(
                    caseInfo: formatter.format(recoveredCount),
                    infoHeader: 'Recoveries',
                    tileColor: Colors.green,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
