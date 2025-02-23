import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

import 'animations.dart';
import 'movement_widget.dart';

class ControlsWidget extends StatefulWidget {
  final O3DController controller;
  //final O3DController controllerRight;
  final VoidCallback toggleCameraControls;

  const ControlsWidget({
    super.key,
    required this.controller,
    //required this.controllerRight,
    required this.toggleCameraControls,
  });

  @override
  State<ControlsWidget> createState() => _ControlsWidgetState();
}

class _ControlsWidgetState extends State<ControlsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // zoom in
            FloatingActionButton(
              onPressed: () {
                widget.controller.cameraOrbit(0, 75, 120);
                widget.controller.cameraTarget(0, 0.85, -2.3);
                widget.controller.autoRotate = false;
              },
              child: Icon(Icons.zoom_in),
            ),
            SizedBox(width: 12),

            //Toggle camera accessibilty
            FloatingActionButton(
              onPressed: widget.toggleCameraControls,
              child: Icon(
                Icons.threed_rotation,
                size: 30,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        MovementWidgets(
          controller: widget.controller,
        ),

        SizedBox(height: 12),

        //ActionWidgets
        Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                widget.controller.animationName = "Walking";
                widget.controller.cameraOrbit(0, 75, 90);
                widget.controller.cameraTarget(0, 0.85, 0);
                widget.controller.play(repetitions: 2);
              },
              child: Icon(
                Icons.directions_walk,
                size: 30,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  widget.controller.animationName = "Jog_Jump";
                  widget.controller.cameraOrbit(0, 75, 90);
                  widget.controller.cameraTarget(0, 0.85, 0);
                  widget.controller.play(repetitions: 2);
                });
              },
              child: Text(
                "Jump",
              ),
            )
          ],
        ),
      ],
    );
  }
}
