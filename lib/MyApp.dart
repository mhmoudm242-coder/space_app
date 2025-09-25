import 'package:flutter/material.dart';
import 'package:space_app/home_screen.dart';
import 'package:space_app/planet_details.dart';
import 'package:space_app/planets_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName,
      routes: {
        HomeScreen.routName: (_) => HomeScreen(),
        PlanetsPage.routName: (_) => PlanetsPage(),
        PlanetDetails.routName: (_) => PlanetDetails(),
      },
    );
  }
}
