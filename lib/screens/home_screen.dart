import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String customerMobile = "";
  String generatedCode = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            Center(
              child: title(),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: RaisedButton(
                child: Text(
                  'Generate',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 15,
                    fontFamily: "BebasNeue",
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                onPressed: () => setState(() {
                  generatedCode = generateRandomString(10);
                }),
                color: Colors.amber,
              ),
            ),
            SizedBox(
              height: 75,
            ),
            Visibility(
              visible: generatedCode != "",
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87),
                    ),
                    child: Center(
                      child: Text(
                        generatedCode,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget title() {
    return Text(
      "Referral Code Generator",
      style: TextStyle(
        color: Colors.indigo,
        fontSize: 30,
        fontFamily: "BebasNeue",
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
      ),
    );
  }

  String generateRandomString(int strlen) {
    const chars = "abcdefghijklmnopqrstuvwxyz0123456789";

    Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < strlen; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }
}
