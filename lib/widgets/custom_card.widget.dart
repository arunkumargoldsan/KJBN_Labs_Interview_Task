import 'package:flutter/material.dart';

Widget customCard(
    String title, String number, Color cardColor, Color cardSideColor) {
  return Card(
    elevation: 4.0,
    color: cardColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
            color: cardSideColor, width: 2.0, style: BorderStyle.solid)),
    margin: const EdgeInsets.all(10.0),
    child: Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              title,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Divider(color: Colors.blueGrey, height: 1.0, thickness: 1.0),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            number,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
