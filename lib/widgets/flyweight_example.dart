import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flyweight_design_pattern/flyweight/iposition_shape.dart';
import 'package:flyweight_design_pattern/flyweight/position_shape_wrapper.dart';
import 'package:flyweight_design_pattern/flyweight/shape_factory.dart';
import 'package:flyweight_design_pattern/flyweight/shape_flyweight_factory.dart';
import 'package:flyweight_design_pattern/model/shape_type.dart';

/// The [FlyweightExample] initialises and contains the
/// [ShapeFlyweightFactory] object.
///
/// Also, it contains a list of positioned shapes - shapesList -
/// which is built using the [ShapeFlyweightFactory] and
/// flyweight-positioned shape objects.
class FlyweightExample extends StatefulWidget {
  const FlyweightExample({Key? key}) : super(key: key);

  @override
  State<FlyweightExample> createState() => _FlyweightExampleState();
}

class _FlyweightExampleState extends State<FlyweightExample> {
  static const int shapesCount = 3000;
  final shapeFactory = const ShapeFactory();

  late final ShapeFlyweightFactory _shapeFlyweightFactory;
  late List<IPositionedShape> _shapesList;

  int _shapeInstanceCount = 0;
  var _useFlyweightFactory = false;

  @override
  void initState() {
    super.initState();
    _shapeFlyweightFactory = ShapeFlyweightFactory(shapeFactory: shapeFactory);
    _buildShapesList();
  }

  void _buildShapesList() {
    var shapeInstancesCount = 0;
    _shapesList = <IPositionedShape>[];

    for (var iterator = 0; iterator < shapesCount; iterator++) {
      final shapeType = _getRandomShapeType();

      final shape = _useFlyweightFactory
          ? _shapeFlyweightFactory.getShape(shapeType)
          : shapeFactory.createShape(shapeType);
      shapeInstancesCount++;
      _shapesList.add(shape);
    }
    setState(() {
      _shapeInstanceCount = _useFlyweightFactory
          ? _shapeFlyweightFactory.getShapeInstancesCount()
          : shapeInstancesCount;
    });
  }

  ShapeType _getRandomShapeType() {
    const values = ShapeType.values;
    return values[Random().nextInt(values.length)];
  }

  void _toggleUseFlyweightFactory(bool value) {
    setState(() {
      _useFlyweightFactory = value;
    });
    _buildShapesList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (final shape in _shapesList) PositionedShapedWrapper(shape: shape),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile.adaptive(
              title: const Text(
                'Use flyweight pattern',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              activeColor: Colors.black,
              value: _useFlyweightFactory,
              onChanged: _toggleUseFlyweightFactory,
            )
          ],
        ),
        Center(
          child: Text(
            'instanceCount = $_shapeInstanceCount',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
