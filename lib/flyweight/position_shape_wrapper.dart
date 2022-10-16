import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flyweight_design_pattern/flyweight/iposition_shape.dart';

class PositionedShapedWrapper extends StatelessWidget {
  final IPositionedShape shape;

  const PositionedShapedWrapper({required this.shape, Key? key})
      : super(key: key);

  double _getPosition(double max, double min) {
    final random = Random().nextDouble() * max;

    return random > min ? random - min : random;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Why?
    return shape.render(
        _getPosition(screenWidth, 16.0), _getPosition(screenHeight, 192.0));
  }
}
