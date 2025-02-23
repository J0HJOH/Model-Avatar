import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

import 'controls_widget.dart';

class ThreeDModel extends StatefulWidget {
  const ThreeDModel({super.key});

  @override
  _ThreeDModelState createState() => _ThreeDModelState();
}

class _ThreeDModelState extends State<ThreeDModel> {
  final O3DController _avatarAController = O3DController();
  final O3DController _controllerRight = O3DController();

  bool isCameraAccesible = false;

  void toggleCameraControls() {
    setState(() {
      isCameraAccesible = !isCameraAccesible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 2,
              child: O3D(
                controller: _avatarAController,
                exposure: 1.2,
                shadowIntensity: 1,

                environmentImage: 'neutral',
                cameraOrbit: CameraOrbit(-70, 75, -2.3),
                skyboxImage: "assets/scenes/buikslotermeerplein_4k.hdr",
                animationName: "Fall_Idle",
                autoPlay: true,
                cameraControls:
                    isCameraAccesible, //can't control animation by touch
                src: "assets/glb/female_animated_avatar.glb",
                // autoPlay: true,
                // autoRotate: true,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 2,
              child: O3D(
                controller: _controllerRight,
                exposure: 1.2,
                shadowIntensity: 1,
                environmentImage: 'neutral',
                cameraOrbit: CameraOrbit(70, 75, 0),
                cameraTarget: CameraTarget(0, 0.2, 0),
                skyboxImage: "assets/scenes/buikslotermeerplein_4k.hdr",
                animationName: "Stand_Wave",
                autoPlay: true,
                cameraControls:
                    isCameraAccesible, //can't control animation by touch
                src: "assets/glb/female_animated_avatar.glb",
                // autoPlay: true,
                // autoRotate: true,
              ),
            ),
          ],
        ),

        // All Controls and animations
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: ControlsWidget(
                  controller: _avatarAController,
                  toggleCameraControls: toggleCameraControls,
                ),
              ),
              Flexible(
                child: ControlsWidget(
                  controller: _controllerRight,
                  toggleCameraControls: toggleCameraControls,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
