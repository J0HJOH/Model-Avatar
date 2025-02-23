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
                skyboxImage:
                    "https://modelviewer.dev/shared-assets/environments/moon_1k.hdr",
                cameraControls:
                    isCameraAccesible, //can't control animation by touch
                src:
                    "https://models.readyplayer.me/67b44ee32808d30f7fa13278.glb",
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
                skyboxImage: "assets/scenes/empty_play_room_4k.hdr",
                cameraControls:
                    isCameraAccesible, //can't control animation by touch
                src:
                    "https://models.readyplayer.me/67b44ee32808d30f7fa13278.glb",
                // autoPlay: true,
                // autoRotate: true,
              ),
            ),
          ],
        ),

        Positioned(
          bottom: 50,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                // DropdownButton(items: [
                //   DropdownMenuItem(child: FloatingActionButton(onPressed: (){}, child: Text(""),))
                // ], onChanged: onChanged)

                FloatingActionButton(
              onPressed: () {},
              child: Text("Avatar 1"),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          right: 0,
          child: FloatingActionButton(
            onPressed: () {},
            child: Text("Avatar 2"),
          ),
        )
        // All Controls and animations
        // ControlsWidget(
        //   controllerLeft: _avatarAController,
        //   controllerRight: _controllerRight,
        //   toggleCameraControls: toggleCameraControls,
        // ),
      ],
    );
  }
}
