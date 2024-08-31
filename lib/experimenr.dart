import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:tracking/shape_maker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Analytics',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  double WIDTH = 400.00;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
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
            title: const Text('Hi   M.H. Abid'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '263 contributions in the last year',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      YearButton(year: 2021, isSelected: false),
                      const SizedBox(width: 8),
                      YearButton(year: 2022, isSelected: false),
                      const SizedBox(width: 8),
                      YearButton(year: 2023, isSelected: true),
                      const SizedBox(width: 8),
                      YearButton(year: 2024, isSelected: false),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Statistic of  sales is presented here by the heat map.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // ContributionCalendar(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatCard(
                          value: '\$4,732.27 M',
                          label: 'Last Month',
                        ),
                        StatCard(
                          value: '\$8,034 M',
                          label: 'Year to Date',
                        ),
                        StatCard(
                          value: '\$3,124 M',
                          label: 'This Month',
                        ),
                      ],
                    ),
                  ),
                  ShapeMaker()
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: CustomPaint(
                  //     size: Size(
                  //         WIDTH,
                  //         (WIDTH * 0.400)
                  //             .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  //     painter: RPSCustomPainter(),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
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
        color: isSelected ? const Color(0xFF0D7517) : Colors.grey[800],
        borderRadius: BorderRadius.circular(16),
        border: !isSelected
            ? Border.all(
                color: const Color(0xFF0D7517),
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
    'Nov',
    'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    // print(
    //     "width----------------------------------------:${MediaQuery.of(context).size.width}");
    return Column(
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
                  color: Colors.grey,
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
    );
  }

  Color? getRandomColor() {
    final random = Random();
    final colors = [
      Colors.grey[600],
      const Color.fromARGB(255, 228, 223, 223),
      const Color(0xFF0D7517),
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
              color: const Color(0xFF0D7517),
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

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 3

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 9, 97, 5)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8036500, size.height * 0.2131333);
    path_0.quadraticBezierTo(size.width * 0.8347750, size.height * 0.1534000,
        size.width * 0.8656000, size.height * 0.2144000);
    path_0.cubicTo(
        size.width * 0.8961250,
        size.height * 0.2761333,
        size.width * 0.9571250,
        size.height * 0.3994000,
        size.width * 0.9876750,
        size.height * 0.4610000);
    path_0.quadraticBezierTo(size.width * 1.0164500, size.height * 0.5199333,
        size.width * 0.9876750, size.height * 0.5801333);
    path_0.quadraticBezierTo(size.width * 0.8956750, size.height * 0.7623333,
        size.width * 0.8650000, size.height * 0.8231333);
    path_0.quadraticBezierTo(size.width * 0.8349250, size.height * 0.8826000,
        size.width * 0.8036500, size.height * 0.8231333);
    path_0.lineTo(size.width * 0.6803750, size.height * 0.5788667);
    path_0.quadraticBezierTo(size.width * 0.6486500, size.height * 0.5217333,
        size.width * 0.6797750, size.height * 0.4574000);
    path_0.quadraticBezierTo(size.width * 0.7107250, size.height * 0.3964000,
        size.width * 0.8036500, size.height * 0.2131333);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 3

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(0, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);

    // Text Layer 3

    canvas.save();
    final pivot_6125485920327 = Offset(size.width * 0.69, size.height * 0.37);
    canvas.translate(pivot_6125485920327.dx, pivot_6125485920327.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_6125485920327.dx, -pivot_6125485920327.dy);
    TextPainter tp_6125485920327 = TextPainter(
      text: TextSpan(
          text: """This Month
\$67879""",
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: size.width * 0.30, minWidth: size.width * 0.30);
    tp_6125485920327.paint(canvas, pivot_6125485920327);
    canvas.restore();

    // Layer 2

    Paint paint_fill_2 = Paint()
      ..color = const Color.fromARGB(255, 9, 97, 5)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.4697250, size.height * 0.2139333);
    path_2.quadraticBezierTo(size.width * 0.5008500, size.height * 0.1542000,
        size.width * 0.5316750, size.height * 0.2152000);
    path_2.cubicTo(
        size.width * 0.5622000,
        size.height * 0.2769333,
        size.width * 0.6232000,
        size.height * 0.4002000,
        size.width * 0.6537500,
        size.height * 0.4618000);
    path_2.quadraticBezierTo(size.width * 0.6825250, size.height * 0.5207333,
        size.width * 0.6537500, size.height * 0.5809333);
    path_2.quadraticBezierTo(size.width * 0.5617500, size.height * 0.7631333,
        size.width * 0.5310750, size.height * 0.8239333);
    path_2.quadraticBezierTo(size.width * 0.5010000, size.height * 0.8834000,
        size.width * 0.4697250, size.height * 0.8239333);
    path_2.lineTo(size.width * 0.3464500, size.height * 0.5796667);
    path_2.quadraticBezierTo(size.width * 0.3147250, size.height * 0.5225333,
        size.width * 0.3458500, size.height * 0.4582000);
    path_2.quadraticBezierTo(size.width * 0.3768000, size.height * 0.3972000,
        size.width * 0.4697250, size.height * 0.2139333);
    path_2.close();

    canvas.drawPath(path_2, paint_fill_2);

    // Layer 2

    Paint paint_stroke_2 = Paint()
      ..color = const Color.fromARGB(0, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_2, paint_stroke_2);

    // Text Layer 2

    canvas.save();
    final pivot_3459715602213 = Offset(size.width * 0.37, size.height * 0.39);
    canvas.translate(pivot_3459715602213.dx, pivot_3459715602213.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_3459715602213.dx, -pivot_3459715602213.dy);
    TextPainter tp_3459715602213 = TextPainter(
      text: TextSpan(
          text: """Last Month
\$8888""",
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            color: Color(0xfffbfbfb),
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: size.width * 0.27, minWidth: size.width * 0.27);
    tp_3459715602213.paint(canvas, pivot_3459715602213);
    canvas.restore();

    // Layer 1

    Paint paint_fill_4 = Paint()
      ..color = const Color.fromARGB(255, 9, 97, 5)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.1397250, size.height * 0.2129333);
    path_4.quadraticBezierTo(size.width * 0.1708500, size.height * 0.1532000,
        size.width * 0.2016750, size.height * 0.2142000);
    path_4.cubicTo(
        size.width * 0.2322000,
        size.height * 0.2759333,
        size.width * 0.2932000,
        size.height * 0.3992000,
        size.width * 0.3237500,
        size.height * 0.4608000);
    path_4.quadraticBezierTo(size.width * 0.3525250, size.height * 0.5197333,
        size.width * 0.3237500, size.height * 0.5799333);
    path_4.quadraticBezierTo(size.width * 0.2317500, size.height * 0.7621333,
        size.width * 0.2010750, size.height * 0.8229333);
    path_4.quadraticBezierTo(size.width * 0.1710000, size.height * 0.8824000,
        size.width * 0.1397250, size.height * 0.8229333);
    path_4.lineTo(size.width * 0.0164500, size.height * 0.5786667);
    path_4.quadraticBezierTo(size.width * -0.0152750, size.height * 0.5215333,
        size.width * 0.0158500, size.height * 0.4572000);
    path_4.quadraticBezierTo(size.width * 0.0468000, size.height * 0.3962000,
        size.width * 0.1397250, size.height * 0.2129333);
    path_4.close();

    canvas.drawPath(path_4, paint_fill_4);

    // Layer 1

    Paint paint_stroke_4 = Paint()
      ..color = const Color.fromARGB(0, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_4, paint_stroke_4);

    // Text Layer 1

    canvas.save();
    final pivot_982509778123 = Offset(size.width * 0.05, size.height * 0.38);
    canvas.translate(pivot_982509778123.dx, pivot_982509778123.dy);
    canvas.rotate(0.0);
    canvas.translate(-pivot_982509778123.dx, -pivot_982509778123.dy);
    TextPainter tp_982509778123 = TextPainter(
      text: TextSpan(
          text: """This year
\$8987""",
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: size.width * 0.23, minWidth: size.width * 0.23);
    tp_982509778123.paint(canvas, pivot_982509778123);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
