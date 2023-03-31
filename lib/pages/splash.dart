import 'package:flutter/material.dart';
import 'package:wordpress_app/pages/home.dart';
import 'package:wordpress_app/utils/next_screen.dart';
import '../config/config.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future _afterSplash() async {
    _gotoHomePage();
  }

  void _gotoHomePage() {
    nextScreenReplace(context, HomePage());
  }

  @override
  void initState() {
    _afterSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          height: 120,
          width: 120,
          image: AssetImage(Config.splash),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
