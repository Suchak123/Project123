import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project123/RouteConstants.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
          () => Navigator.of(context).pushReplacementNamed(RouteConstants.loginRoute),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.green.shade200,
          ),
          Center(
            child: Text('LOADING...'),
          ),
        ],
      ),
    );
  }
}
