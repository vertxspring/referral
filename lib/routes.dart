import 'package:flutter/material.dart';

import 'package:simhadri_referral/screens/home_screen.dart';
import 'package:simhadri_referral/screens/loading_screen.dart';
import 'package:simhadri_referral/screens/login_screen.dart';

final routes = {
  '/': (BuildContext context) => new LoadingScreen(),
  '/login': (BuildContext context) => new LoginScreen(),
};
