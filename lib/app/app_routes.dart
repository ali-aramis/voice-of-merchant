import 'package:flutter/material.dart';



class AppRoutes {
  static const String home = '/';
  static const String complaintForm = '/complaint-form';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const Scaffold(
      body: Center(
        child: Text('Home Screen'),
      ),
    ),


  };
}