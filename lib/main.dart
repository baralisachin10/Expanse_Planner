import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import './screens/myHomaPage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // To make device run only on potrait mode
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Personal Expenses',
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(), //This is main page of our app

        // theme data for overall app
        theme: ThemeData(
          primaryColor: Colors.purple,
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.orange),
          textTheme: TextTheme(
            displayLarge: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
            titleLarge: GoogleFonts.libreBaskerville(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: GoogleFonts.libreBaskerville(
              fontSize: 14,
              color: Colors.grey,
            ),
            // ignore: deprecated_member_use
          ),
        ));
  }
}
