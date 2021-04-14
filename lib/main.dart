import 'package:flutter/material.dart';
import 'package:my_app_2/src/pages/image_page.dart';
import 'package:my_app_2/src/pages/login_page.dart';
import 'package:my_app_2/src/pages/post_page.dart';
import 'package:my_app_2/src/pages/splash_page.dart';
import 'src/pages/home_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle
        .light); //para modificar el color de la barra de estatus de arriba que dice la hora y la bateria etc.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        ImagePage.routeName: (BuildContext _) => ImagePage(),
        PostPage.routeName: (BuildContext _) => PostPage(),
        LoginPage.routeName: (BuildContext _) => LoginPage(),
      },
    );
  }
}
