import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeCountryCard extends StatelessWidget {
  final int caseCount;
  final String infoHeader;
  final Color tileColor;

  HomeCountryCard({this.caseCount, this.infoHeader, this.tileColor});

  final formatter = NumberFormat("###,###");

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: tileColor,
      child: Container(
        width: width * 0.45,
        height: height * 0.13,
        padding: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              infoHeader,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '${formatter.format(caseCount)}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
