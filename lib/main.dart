import 'package:clubhouse_ui/constants.dart';
import 'package:clubhouse_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clubhouse UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackground,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        scaffoldBackgroundColor: kBackground,
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: kAccentColor,
        ),
        fontFamily: GoogleFonts.montserrat().toString(),
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}
