import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flyweight_design_pattern/flyweight/iposition_shape.dart';

/// [Circle] is a concrete class with
/// implements [IPositionedShape] and have
/// its intrinsic state like [color] and
/// [diameter].
class Circle extends IPositionedShape {
  Color color;
  double diameter;

  Circle({
    required this.color,
    required this.diameter,
  });

  @override
  Widget render(double x, double y) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        height: diameter,
        width: diameter,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
