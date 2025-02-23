import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class MovementWidgets extends StatelessWidget {
  const MovementWidgets({
    super.key,
    required O3DController controllerLeft,
    required O3DController controllerRight,
  })  : _controllerLeft = controllerLeft,
        _controllerRight = controllerRight;

  final O3DController _controllerLeft;
  final O3DController _controllerRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FloatingActionButton(
          onPressed: () {
            _controllerLeft.cameraOrbit(90, 75, 120);
            _controllerLeft.cameraTarget(1, 1, 0);
            _controllerLeft.autoRotate = false;
            _controllerRight.cameraOrbit(-90, 75, 120);
            _controllerRight.cameraTarget(-1, 1, 0);
            _controllerRight.autoRotate = false;
          },
          child: Icon(Icons.swipe_left),
        ),
        SizedBox(width: 20),
        FloatingActionButton(
          onPressed: () {
            _controllerLeft.cameraOrbit(0, 75, 90);
            _controllerLeft.cameraTarget(0, 0.85, 0);
            _controllerLeft.autoRotate = false;
            _controllerRight.cameraOrbit(0, 75, 90);
            _controllerRight.cameraTarget(0, 0.85, 0);
            _controllerRight.autoRotate = false;
          },
          child: Icon(Icons.center_focus_strong),
        ),
        SizedBox(width: 20),
        FloatingActionButton(
          onPressed: () {
            _controllerLeft.cameraOrbit(-90, 75, 120);
            _controllerLeft.cameraTarget(-1, 1, 0);
            _controllerLeft.autoRotate = false;
            _controllerRight.cameraOrbit(90, 75, 120);
            _controllerRight.cameraTarget(1, 1, 0);
            _controllerRight.autoRotate = false;
          },
          child: Icon(Icons.swipe_right),
        ),
      ],
    );
  }
}