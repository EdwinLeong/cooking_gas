import 'package:flutter/material.dart';

Map<int, Color> customColor = <int, Color>{
  50: const Color.fromRGBO(152, 17, 109, .1),
  100: const Color.fromRGBO(152, 17, 109, .2),
  200: const Color.fromRGBO(152, 17, 109, .3),
  300: const Color.fromRGBO(152, 17, 109, .4),
  400: const Color.fromRGBO(152, 17, 109, .5),
  500: const Color.fromRGBO(152, 17, 109, .6),
  600: const Color.fromRGBO(152, 17, 109, .7),
  700: const Color.fromRGBO(152, 17, 109, .8),
  800: const Color.fromRGBO(152, 17, 109, .9),
  900: const Color.fromRGBO(152, 17, 109, 1),
};
MaterialColor colorCustom = MaterialColor(0xFF880E4F, customColor);

final ThemeData lightTheme = ThemeData(
  primarySwatch: colorCustom,
  primaryColor: Colors.blue,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Color.fromRGBO(152, 17, 109, 1),
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  fontFamily: 'Proxima Nova Alt',
);

dynamic textTheme = const TextTheme(
  headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
  bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  headline5: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
);
