import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

class QuantityComponent extends StatelessWidget{
  final num maxVal;
  final num initVal;
  final num minVal;
  final num steps;

  const QuantityComponent({super.key,
    required this.maxVal,
    required this.initVal,
    required this.minVal,
    required this.steps,
  });


  @override
  Widget build(BuildContext context) {
    return InputQty(
      // textFieldDecoration: const InputDecoration(
      //   hintStyle: TextStyle(
      //     color: Colors.black
      //   )
      // ),
      btnColor1: Theme.of(context).primaryColor,
      btnColor2: Theme.of(context).primaryColor,
      maxVal: maxVal,
      initVal: initVal ,
      minVal: minVal,
      steps: steps,
      onQtyChanged: (val) {
        print(val);
      },

    );
  }

}