import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:simhadri_referral/resources/base_api.dart';

import 'routes.dart';

void main() async {
  runApp(TokenGeneratorMain());
}

class TokenGeneratorMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.yellow,

        // Define the default font family.
        fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(),
      ),
      routes: routes,
    );
  }
}
