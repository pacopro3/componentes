import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pinkAccent;
  BorderRadiusGeometry _borderradius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(
            milliseconds: 300,
          ),
          curve: Curves.slowMiddle,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderradius,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarForma,
        child: Icon(Icons.play_circle_outline),
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();

    setState(() {
      _width = random.nextInt(400).toDouble();
      _height = random.nextInt(400).toDouble();
      _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255),
          random.nextInt(255), random.nextDouble());
      _borderradius = BorderRadius.circular(random.nextInt(90).toDouble());
    });
  }
}
