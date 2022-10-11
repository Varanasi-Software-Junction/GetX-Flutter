import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncrementDecrementController extends GetxController {
  var count = 0.obs;
  var colorno=0.obs;
  var color=Colors.teal.obs;
  var boolvalue = false.obs; // our observable

  // swap true/false & save it to observable
  void toggle() => boolvalue.value = !boolvalue.value;

  List<Color> colors=[Colors.yellow,Colors.teal,Colors.blue,Colors.lime];
  void increment() {
    count++;
    int x=count.toInt();
    if(x<0)
      x=-x;
    colorno.value=(x % colors.length);
    color.value=colors[colorno.toInt()] as MaterialColor;
    update();
  }

  void decrement() {
    count--;
    int x=count.toInt();
    if(x<0)
      x=-x;
    colorno.value=(x % colors.length);
    update();
  }
}
