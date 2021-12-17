import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_recognation_test/view/home/controller/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() => FloatingActionButton(
            onPressed: () {
              _controller.speecEnabled = !_controller.speecEnabled;
              if (_controller.speecEnabled == true) {
                _controller.startListening();
              } else {
                _controller.stopListening();
              }
            },
            child: Icon(_controller.speecEnabled ? Icons.mic : Icons.mic_off),
          )),
      appBar: AppBar(
        title: Text("Ses Tanıma"),
      ),
      body: Center(
        child: Obx(() => Text(_controller.lastWords)),
      ),
    );
  }
}
