import 'dart:ffi';

import 'package:flutter/material.dart';

Widget customTimer(int durationValue) {
  return Center(
    child: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: 1 - (durationValue / 5),
            backgroundColor: Colors.grey,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            strokeWidth: 5.0,
          ),
        ),
        Text(durationValue.toString(), style: const TextStyle(fontSize: 16.0),),
      ],
    ),
  );
}
