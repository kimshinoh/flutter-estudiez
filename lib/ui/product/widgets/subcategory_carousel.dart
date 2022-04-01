import 'package:flutter/material.dart';

class SubcategoryCarousel extends StatelessWidget {
  const SubcategoryCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: 60,
      height: height,
      child: ListView(
        // This next line does the trick.

        children: <Widget>[
          Container(
            height: 60,
            color: Colors.red,
          ),
          Container(
            height: 60.0,
            color: Colors.blue,
          ),
          Container(
            height: 60.0,
            color: Colors.green,
          ),
          Container(
            height: 60.0,
            color: Colors.yellow,
          ),
          Container(
            height: 60.0,
            color: Colors.orange,
          ),
          Container(
            height: 60.0,
            color: Colors.green,
          ),
          Container(
            height: 60.0,
            color: Colors.yellow,
          ),
          Container(
            height: 60.0,
            color: Colors.orange,
          ),
          Container(
            height: 60.0,
            color: Colors.green,
          ),
          Container(
            height: 60.0,
            color: Colors.yellow,
          ),
          Container(
            height: 60.0,
            color: Colors.orange,
          ),
          Container(
            height: 60.0,
            color: Colors.green,
          ),
          Container(
            height: 60.0,
            color: Colors.yellow,
          ),
          Container(
            height: 60.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
