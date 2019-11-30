import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simhadri_referral/model/api_response.dart';
import 'package:simhadri_referral/model/status.dart';
import 'package:simhadri_referral/screens/home_screen.dart';
import 'package:simhadri_referral/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String mobile = "";
  LoginService loginService = LoginService();
  @override
  Widget build(BuildContext context2) {
    return WillPopScope(
        onWillPop: exitApp,
        child: Scaffold(
          body: Builder(
            builder: (context) => Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 200,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Enter your 10 digit mobile number",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    maxLength: 10,
                    onChanged: (num) => this.setState(() => mobile = num),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  RaisedButton(
                    child: Text("Sign In"),
                    onPressed: attemptLogin,
                    color: Theme.of(context).accentColor,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void attemptLogin() async {
    if (mobile.length < 10) {
      final snackBar = SnackBar(content: Text('Invalid mobile number'));
      Scaffold.of(context).showSnackBar(snackBar);
    }
    ApiResponse<String> res = await loginService.attemptLogin(mobile);
    print("Loggin in..");
    print(res.status);
    if (res.status == Status.SUCCESS) {
      print("Loggin in");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      print("Failed to log in");
    }
  }

  Future<bool> exitApp() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  'No',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                color: Theme.of(context).accentColor,
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text(
                  'Yes',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                color: Theme.of(context).accentColor,
              ),
            ],
          ),
        ) ??
        false;
  }
}
