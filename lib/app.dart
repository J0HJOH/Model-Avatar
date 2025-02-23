import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'three_d_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      home: ThreeDModel(),
    );
  }
}
