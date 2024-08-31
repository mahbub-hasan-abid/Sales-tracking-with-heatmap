import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShapeMaker extends StatelessWidget {
  ShapeMaker({super.key});

  @override
  Widget build(BuildContext context) {
    var WIDTH = MediaQuery.of(context).size.width;
    var HEIGHT = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: HEIGHT * 0.3,
                height: HEIGHT * 0.03,
                color: const Color.fromARGB(255, 36, 229, 3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: pi / 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 36, 229, 3),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: HEIGHT * .11,
                      height: HEIGHT * .11,
                      child: Transform.rotate(
                          angle: -pi / 4,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                '\$1.7M',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w900),
                              )),
                              Center(
                                  child: Text(
                                'This month ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )),
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Transform.rotate(
                    angle: pi / 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 36, 229, 3),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: HEIGHT * .11,
                      height: HEIGHT * .11,
                      child: Transform.rotate(
                          angle: -pi / 4,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                '\$88M',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w900),
                              )),
                              Center(
                                  child: Text(
                                'This Year ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )),
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Transform.rotate(
                    angle: pi / 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 36, 229, 3),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: HEIGHT * .11,
                      height: HEIGHT * .11,
                      child: Transform.rotate(
                          angle: -pi / 4,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                '\$7.8M',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w900),
                              )),
                              Center(
                                  child: Text(
                                'Last month ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
