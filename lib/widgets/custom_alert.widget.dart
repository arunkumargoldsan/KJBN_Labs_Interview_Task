import 'package:flutter/material.dart';

Widget customAlert(String title, String desc, int attempts, int score, Color cardColor, Color cardSideColor, int status) {
  return Card(
    elevation: 4.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
            color: cardSideColor, width: 2.0, style: BorderStyle.solid)),
    color: cardColor,
    margin: const EdgeInsets.all(20.0),
    child: Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Text(
              title,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
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
            (status == 1 || status == 3) ? desc + score.toString() + "/" + attempts.toString() : desc + attempts.toString(),
            style: const TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    ),
  );
}
