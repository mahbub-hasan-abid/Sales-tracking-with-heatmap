import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tracking/shape_maker.dart';
import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      //theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var WIDTH = MediaQuery.of(context).size.width;
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.black,
            elevation: 0,
            leading: const Icon(Icons.menu, color: Colors.white),
            centerTitle: true, // Replace with your desired icon
            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Align content to the right
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.black, // Background color of the square
                      shape: BoxShape.rectangle,
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                      border: Border.all(
                          color: Colors.white, width: .5), // White border
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 245, 245, 245)
                              .withOpacity(0.9), // Shadow color
                          spreadRadius: 1, // Spread radius
                          blurRadius: 1, // Blur radius
                          // offset: const Offset(1, 1), // Shadow offset
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                        SizedBox(width: 8.0), // Space between image and text
                        Text(
                          'M.H. Abid  ',
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontWeight: FontWeight.bold, // Make text bold
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      'Hello M.H. Abid',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(width: 16),
                    Icon(
                      Icons.ac_unit_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BeautifulButton(
                        text: "All",
                        color: Color.fromARGB(255, 58, 54, 54),
                        onPressed: () {
                          // Handle button press
                        },
                      ),
                      BeautifulButton(
                        text: "Pending",
                        color: Color.fromARGB(255, 58, 54, 54),
                        onPressed: () {
                          // Handle button press
                        },
                      ),
                      BeautifulButton(
                        text: "Received",
                        color: Color.fromARGB(255, 58, 54, 54),
                        onPressed: () {
                          // Handle button press
                        },
                      ),
                      BeautifulButton(
                        text: "Upcomming",
                        color: Color.fromARGB(255, 58, 54, 54),
                        onPressed: () {
                          // Handle button press
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                height: 380,
                width: 390,
                // color: Colors.amber,
                child: Stack(
                  // alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 210,
                      left: 35,
                      child: Transform.rotate(
                        angle: -pi / 4,
                        child: Container(
                          color: const Color.fromARGB(255, 36, 229, 3),
                          width: 260,
                          height: 40,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 30,
                      top: 30,
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30.0),
                              //  topRight: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0),
                            ),
                            color: Color.fromARGB(255, 36, 229, 3)),
                        height: 170,
                        width: 170,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.gpp_good_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            Text(
                              "1.234K",
                              style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "Products",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 30,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            // topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                          ),
                          color: Color.fromARGB(255, 36, 229, 3),
                        ),
                        height: 170,
                        width: 170,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_add_alt_1_sharp,
                              color: Colors.black,
                              size: 30,
                            ),
                            Text(
                              "8.95K",
                              style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "Customers",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 30,
                      top: 210,
                      child: Container(
                        decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(30),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                          ),
                          color: Color.fromARGB(255, 58, 54, 54),
                        ),
                        height: 150,
                        width: 150,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.scale_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              "22130K",
                              style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "Sales",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 30,
                      child: Container(
                        decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(30),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                          ),
                          color: Color.fromARGB(255, 58, 54, 54),
                        ),
                        height: 150,
                        width: 150,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.games_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              "\$9745",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "Revenue",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(20),
                ),
                border: Border(
                  top: BorderSide(
                    color: Colors.white, // Set the color of the border
                    width: 2.0, // Set the width of the border
                  ),
                )),
            child: BottomAppBar(
              color: Colors.transparent,
              shape: const CircularNotchedRectangle(),
              notchMargin: 8.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.bar_chart, color: Colors.white),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 48),
                  IconButton(
                    icon: const Icon(Icons.person, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Stack(alignment: Alignment.center, children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color.fromARGB(255, 36, 229, 3),
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ])),
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  StatCard({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class PaddedContainer extends StatelessWidget {
  final Color color;
  final double top;
  final double left;

  PaddedContainer({required this.color, required this.top, required this.left});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 100,
        height: 100,
      ),
    );
  }
}

class BeautifulButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  BeautifulButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 5,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
