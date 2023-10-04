import 'package:flutter/material.dart';
import 'package:lennar_app/view_models/home_screen_view_model.dart';
import 'package:lennar_app/view_models/login_screen_view_model.dart';
import 'package:lennar_app/view_models/splash_screen_view_model.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider<ChangeNotifier>> appProviders() {
  return [
    ChangeNotifierProvider(create: (context) => HomeScreenViewModel()),
    ChangeNotifierProvider(create: (context) => LoginScreenViewModel()),
    ChangeNotifierProvider(create: (context) => SplashScreenViewModel()),
  ];
}