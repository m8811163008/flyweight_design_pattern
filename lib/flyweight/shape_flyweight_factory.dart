import 'package:flyweight_design_pattern/flyweight/iposition_shape.dart';
import 'package:flyweight_design_pattern/flyweight/shape_factory.dart';
import 'package:flyweight_design_pattern/model/shape_type.dart';

/// The [ShapeFlyweightFactory] is a flyweight factory that contains a map of flyweight objects - [shapesMap].
class ShapeFlyweightFactory {
  ShapeFactory shapeFactory;
  Map<ShapeType, IPositionedShape> shapesMap = {};

  ShapeFlyweightFactory({required this.shapeFactory});

  /// When [getShape] is requested the flyweight factory checks
  /// whether it exists on the map and returns it from there.Otherwise, a new instance of the shape is created using the
  /// [ShapeFactory] and persisted in the map object for further
  /// usage.
  IPositionedShape getShape(ShapeType shapeType) {
    if (!shapesMap.containsKey(shapeType)) {
      shapesMap[shapeType] = shapeFactory.createShape(shapeType);
    }
    return shapesMap[shapeType]!;
  }

  int getShapeInstancesCount() => shapesMap.length;
}
