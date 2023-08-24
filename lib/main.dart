import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec/my_Colors.dart';
import 'package:tec/view/register_intro.dart';
import 'package:tec/view/splash_Screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: solidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: solidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa'), // farsi
        ],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 2)),
                filled: true,
                fillColor: Colors.white),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return textTheme.headline6;
                  }
                  return textTheme.headline6;
                }),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return solidColors.seeMore;
                  }
                  return solidColors.colorPrimary;
                }),
              ),
            ),
            fontFamily: 'sans',
            textTheme: TextTheme(
              headline1: TextStyle(
                  fontFamily: 'sans',
                  fontSize: 16,
                  color: solidColors.posterTitle,
                  fontWeight: FontWeight.w700),
              headline3: TextStyle(
                  fontFamily: 'sans',
                  fontSize: 14,
                  color: solidColors.posterSubTitle,
                  fontWeight: FontWeight.w300),
              headline4: TextStyle(
                  fontFamily: 'sans',
                  fontSize: 16,
                  color: solidColors.hintColor,
                  fontWeight: FontWeight.w700),
              headline2: TextStyle(
                  fontFamily: 'sans',
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
              headline5: TextStyle(
                  fontFamily: 'sans',
                  fontSize: 16,
                  color: solidColors.seeMore,
                  fontWeight: FontWeight.w700),
              headline6: TextStyle(
                  fontFamily: 'sans',
                  fontSize: 16,
                  color: solidColors.textTiltle,
                  fontWeight: FontWeight.w700),
            )),
        home: RegisterIntro());
  }
}
