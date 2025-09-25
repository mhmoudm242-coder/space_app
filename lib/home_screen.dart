import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_app/planets_page.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/1.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Explore\nThe\nUniverse",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,

                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 22,
              left: 15,
              right: 15,
              child:
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  backgroundColor: Color(0xffEE403D),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, PlanetsPage.routName);
                },
                child:
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        'Explore',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_right_alt_rounded, color: Colors.white,
                        size: 30,)
                    ],
                  ),
                ),

              ),
          )
       ],
      ),
    );
  }
}
