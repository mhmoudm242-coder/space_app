import 'package:flutter/material.dart';
import 'package:space_app/custom_app_bar.dart';
import 'package:space_app/planet_details.dart';

class PlanetsPage extends StatefulWidget {
  static const String routName = 'planets';

  @override
  State<PlanetsPage> createState() => _PlanetsPageState();
}

class _PlanetsPageState extends State<PlanetsPage> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    pageController.addListener(_pageChange);
  }

  List<Map<String, String>> planets = [
    {'name': 'Mars', 'image': 'assets/images/mars.png'},
    {'name': 'Earth', 'image': 'assets/images/earth 1.png'},
    {'name': 'Jupiter', 'image': 'assets/images/jupiter.png'},
    {'name': 'Mercury', 'image': 'assets/images/mercury.png'},
    {'name': 'Neptune', 'image': 'assets/images/neptune.png'},
    {'name': 'Saturn', 'image': 'assets/images/saturn.png'},
    {'name': 'Sun', 'image': 'assets/images/sun.png'},
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, String> planet = planets[currentIndex];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            CustomAppBar(
              title: 'Explore',
              sideTitle: "Which planet \nwould you like to explore?",
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: planets.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    planets[index]['image']!,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (pageController.page!.toInt() == 0) {
                        return;
                      }
                      pageController.animateToPage(
                        pageController.page!.toInt() - 1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInSine,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(12),
                      backgroundColor: Color(0xffEE403D),
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Expanded(
                    child: Text(
                      planet['name']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      pageController.animateToPage(
                        pageController.page!.toInt() + 1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInSine,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(12),
                      backgroundColor: Color(0xffEE403D),
                    ),
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 8),
                backgroundColor: Color(0xffEE403D),
              ),
              onPressed: () {
                Navigator.pushNamed(context, PlanetDetails.routName,arguments: planets[currentIndex]);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Text(
                      "Explore ${planet['name']}",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_right_alt_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pageChange() {
    if (pageController.page! % 1 == 0) {
      setState(() {
        currentIndex = pageController.page!.toInt() % 7;
      });
    }
  }
}
