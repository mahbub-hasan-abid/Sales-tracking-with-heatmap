import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tracking/shape_maker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sales Analytics',
      //  theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.only(left: 18),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          ),
          title: const Text(
            'Hi  M.H. Abid',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sales per employee per month',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  '263 contributions in the last year',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    YearButton(year: 2021, isSelected: false),
                    const SizedBox(width: 8),
                    YearButton(year: 2022, isSelected: false),
                    const SizedBox(width: 8),
                    Container(
                      width: 75,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 36, 229, 3),
                      ),
                      child: const Center(
                        child: Text(
                          "2023",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    YearButton(year: 2024, isSelected: false),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Statistic of  sales is presented here by  heat map.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                ContributionCalendar(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Less',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      color: const Color.fromARGB(255, 228, 223, 223),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      color: const Color.fromARGB(255, 36, 229, 3),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'More',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       StatCard(
                //         value: '\$4,732.27',
                //         label: 'Last Month',
                //       ),
                //       StatCard(
                //         value: '\$8,034',
                //         label: 'Year to Date',
                //       ),
                //       StatCard(
                //         value: '\$3,124',
                //         label: 'This Month',
                //       ),
                //     ],
                //   ),
                // ),
                ShapeMaker()
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
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
            shape: CircularNotchedRectangle(),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Stack(
          alignment: Alignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color.fromARGB(255, 36, 229, 3),
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YearButton extends StatelessWidget {
  final int year;
  final bool isSelected;

  YearButton({
    required this.year,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color.fromARGB(255, 36, 229, 3)
            : Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
        border: !isSelected
            ? Border.all(
                color: const Color.fromARGB(255, 36, 229, 3),
                width: 4,
              )
            : null,
      ),
      child: Text(
        year.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ContributionCalendar extends StatelessWidget {
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    // 'Nov',
    // 'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              months.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  months[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 24,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 0.8,
            ),
            itemCount: 360,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: getRandomColor(),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Color? getRandomColor() {
    final random = Random();
    final colors = [
      Colors.grey[600],
      const Color.fromARGB(255, 228, 223, 223),
      const Color.fromARGB(255, 36, 229, 3),
    ];
    return colors[random.nextInt(colors.length)];
  }
}

class StatCard extends StatelessWidget {
  final String value;
  final String label;

  StatCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 36, 229, 3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
