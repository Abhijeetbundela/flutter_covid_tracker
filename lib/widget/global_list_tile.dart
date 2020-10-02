import 'package:flutter/material.dart';

class GlobalListTile extends StatelessWidget {
  final String caseInfo;
  final String infoHeader;
  final Color tileColor;

  GlobalListTile({this.caseInfo, this.infoHeader, this.tileColor});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: tileColor,
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.02, horizontal: width * 0.04),
          width: width,
          height: height * 0.14,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Total $infoHeader",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
              Text(caseInfo,
                  style: TextStyle(
                      color: Colors.white, fontSize: 18))
            ],
          )),
    );
  }
}
