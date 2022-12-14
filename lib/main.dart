import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'incrementdecrementcontroller.dart';

void main() {
  runApp(const VsjApp());
}

class VsjApp extends StatelessWidget {
  const VsjApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vsj Getx App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const First(),
    );
  }
}

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IncrementDecrementController controller =
        Get.put(IncrementDecrementController());
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text("Getx: ${controller.count}",
              style: TextStyle(
                  backgroundColor:
                      controller.colors[controller.colorno.toInt()]))),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Obx(() => Text('Switch Setting: ${controller.boolvalue}')),
              Obx(
                () => Switch(
                    onChanged: (val) => controller.toggle(),
                    value: controller.boolvalue.value),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Get.find<IncrementDecrementController>().decrement();
                    },
                    child: Obx(() => Text("Clicks: ${controller.count}"))),
              )
            ],
          ),
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            onPressed: () =>
                {Get.find<IncrementDecrementController>().decrement()},
            child: Icon(Icons.navigate_before_rounded),
          ),
          FloatingActionButton(
            onPressed: () =>
                {Get.find<IncrementDecrementController>().increment()},
            child: Icon(Icons.navigate_next_rounded),
            heroTag: "fab2",
          ),
        ]));
  }
}
