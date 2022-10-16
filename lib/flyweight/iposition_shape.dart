import 'package:flutter/material.dart';

/// The [IPositionedShape] us used as an interface for the specific shape classes.
abstract class IPositionedShape {
  /// renders the shape - returns the
  /// positioned shape widget.
  /// Also the extrinsic state (x and y
  /// coordinates) is passed to this method
  /// to render the shape in the exact
  /// position.
  Widget render(double x, double y);
}
