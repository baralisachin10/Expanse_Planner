import 'package:flutter/material.dart';
import './screens/myHomaPage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.orange),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
        ),
        // ignore: deprecated_member_use
      ),
    )
    );
  }
}
