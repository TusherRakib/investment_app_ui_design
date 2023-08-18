import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:investment_app_ui_design/views/home/home.dart';
import 'package:investment_app_ui_design/views/ongoing_campaigns/ongoing_campaigns_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'State Management with GetX',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFBEB),
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0.0,
        ),
        textTheme: GoogleFonts.ubuntuTextTheme(
          Theme.of(context).textTheme, // Inherit current text theme
        ),
      ),
      home: HomeView(),
    );
  }
}
