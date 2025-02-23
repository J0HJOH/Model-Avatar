import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'three_d_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      home: KeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKeyEvent: (event) {
          if (event is KeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              print("Rotate Left");
            } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              print("Rotate Right");
            } else if (event.logicalKey == LogicalKeyboardKey.space) {
              print("Jump");
            }
          }
        },
        child: ThreeDModel(),
      ),
    );
  }
}
