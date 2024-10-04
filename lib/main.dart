import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:id_camp/pages/dropDownButtonPage.dart';
import 'package:id_camp/pages/iconButtonPage.dart';
import 'package:id_camp/pages/inputWidgetPage.dart';
import 'package:id_camp/pages/listViewMapPage.dart';
import 'package:id_camp/pages/mainPages.dart';
import 'package:id_camp/pages/perpindahanScreenPage.dart';
import 'package:id_camp/pages/responsiveLayoutLayoutBuilder.dart';
import 'package:id_camp/pages/responsiveLayoutMedQuery.dart';
import 'package:id_camp/pages/responsiveLayoutPractice.dart';
import 'package:id_camp/pages/widgetExpandedFlexiblePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
      home: const Responsivelayoutpractice()
    );
  }
}