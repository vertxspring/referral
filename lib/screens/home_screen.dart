import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simhadri_referral/model/api_response.dart';
import 'package:simhadri_referral/resources/base_api.dart';
import 'package:simhadri_referral/services/referral_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String customerMobile = "";
  String generatedCode = "";
  final key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: key,
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
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontFamily: "BebasNeue",
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                onPressed: () async {
                  generatedCode = await generateRandomString(10);
                  setState(() => {});
                },
                color: Theme.of(context).accentColor,
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
                    child: GestureDetector(
                      child: Center(
                        child: Text(
                          generatedCode,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: generatedCode));
                        key.currentState.showSnackBar(SnackBar(
                          content: Text(
                            "Copied to clipboard!",
                            textAlign: TextAlign.center,
                          ),
                        ));
                      },
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
        color: Theme.of(context).accentColor,
        fontSize: 30,
        fontFamily: "BebasNeue",
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
      ),
    );
  }

  Future<String> generateRandomString(int strlen) async {
    /*const chars = "abcdefghijklmnopqrstuvwxyz0123456789";

    Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < strlen; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;*/
    ApiResponse<String> res = await ReferralService().generateReferralCode();
    return res.body;
  }
}
