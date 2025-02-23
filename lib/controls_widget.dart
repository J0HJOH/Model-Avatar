import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

import 'animations.dart';
import 'movement_widget.dart';

class ControlsWidget extends StatefulWidget {
  final O3DController controllerLeft;
  final O3DController controllerRight;
  final VoidCallback toggleCameraControls;

  const ControlsWidget({
    super.key,
    required this.controllerLeft,
    required this.controllerRight,
    required this.toggleCameraControls,
  });

  @override
  State<ControlsWidget> createState() => _ControlsWidgetState();
}

class _ControlsWidgetState extends State<ControlsWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 20,
      child: Column(
        children: [
          Row(
            children: [
              // zoom in
              FloatingActionButton(
                onPressed: () {
                  widget.controllerLeft.cameraOrbit(0, 75, 120);
                  widget.controllerLeft.cameraTarget(0, 0.85, -2.3);
                  widget.controllerLeft.autoRotate = false;

                  widget.controllerRight.cameraOrbit(0, 75, 120);
                  widget.controllerRight.cameraTarget(0, 0.85, -2.3);
                  widget.controllerRight.autoRotate = false;
                },
                child: Icon(Icons.zoom_in),
              ),
              SizedBox(width: 20),

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
          SizedBox(height: 20),
          MovementWidgets(
            controllerLeft: widget.controllerLeft,
            controllerRight: widget.controllerRight,
          ),

          SizedBox(height: 20),

          //ActionWidgets
          Row(
            children: [
              FloatingActionButton(
                onPressed: () {
                  print("Walk");
                },
                child: Icon(
                  Icons.directions_walk,
                  size: 30,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  print("Walk");
                  // String walkKey = Animations.animationData[0].key;
                  // controllerRight.playAnimation(walkKey);
                  setState(() {
                    widget.controllerRight.animationName =
                        Animations.animationData[0].name.toString();
                    widget.controllerRight.play();
                  });
                },
                child: Text(
                  Animations.animationData.isNotEmpty
                      ? Animations.animationData[0].key
                      : "No Data",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
