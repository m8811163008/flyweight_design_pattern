import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flyweight_design_pattern/flyweight/iposition_shape.dart';

/// [Square] is a concrete class with
/// implements [IPositionedShape] and have
/// its intrinsic state like [color] and
/// [width].
class Square extends IPositionedShape {
  Color color;
  double width;

  Square({
    required this.color,
    required this.width,
  });
  double get height => width;
  @override
  Widget render(double x, double y) {
    return Positioned(
      bottom: y,
      left: x,
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}
