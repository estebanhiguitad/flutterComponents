import 'package:flutter/material.dart';

import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  String _endedAnimationText = '';

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contenedor animado'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          onEnd: () {
            setState(() {
              _endedAnimationText = 'Terminé la animación';
            });
          },
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
          child: Center(
              child: Text(
            _endedAnimationText,
            style: TextStyle(color: Colors.yellow),
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.replay_circle_filled),
        onPressed: _chageRectangleState,
      ),
    );
  }

  void _chageRectangleState() {
    final random = Random();
    setState(() {
      _endedAnimationText = '';
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      );
      print(_color.value);
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _borderRadius = BorderRadius.circular(
        random.nextInt(100).toDouble(),
      );
    });
  }
}
