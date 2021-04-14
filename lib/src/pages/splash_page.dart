import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app_2/src/pages/home_page.dart';
import 'package:my_app_2/src/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    Future.delayed(Duration(seconds: 2), () {
      print('ir a home');
      this._checkLogin();

      // Navigator.pushReplacementNamed(context, LoginPage.routeName);
    });
  }

  _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final bool wasLogin = prefs.getBool('wasLogin');
    print('wasLogin $wasLogin');

    if (wasLogin == null || wasLogin == false) {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    } else {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(
          radius: 15,
        ),
      ),
    );
  }
}
