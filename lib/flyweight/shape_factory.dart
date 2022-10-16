import 'package:flutter/material.dart';
import 'package:flyweight_design_pattern/flyweight/iposition_shape.dart';
import 'package:flyweight_design_pattern/model/circle.dart';
import 'package:flyweight_design_pattern/model/shape_type.dart';
import 'package:flyweight_design_pattern/model/square.dart';

/// The [ShapeFactory] is a simple factory
/// class that creates and returns a specific
/// shape object bia the [createShape] method
/// by providing [ShapeType].
class ShapeFactory {
  const ShapeFactory();

  IPositionedShape createShape(ShapeType shapeType) {
    switch (shapeType) {
      case ShapeType.circle:
        return Circle(
            color: Colors.red.withOpacity(
              0.2,
            ),
            diameter: 10.0);
      case ShapeType.square:
        return Square(color: Colors.blue.withOpacity(0.2), width: 10.0);
      default:
        throw Exception('Shape type $shapeType is not supported.');
    }
  }
}
