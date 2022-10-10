import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: "/home",
      getPages: [
        GetPage(
          name: '/home',
          page: () => First(),
        ),
      ],
    );
  }
}

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Demo"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [

            GetBuilder<Controller>(
              init: Controller(),
              builder: (_) => Text("No of Clicks : ${_.count}"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.find<Controller>().increment();
        },
      ),
    );
  }
}

class Controller extends GetxController {
  int count = 0;
  void increment() {
    count++;
    update();
  }
}
