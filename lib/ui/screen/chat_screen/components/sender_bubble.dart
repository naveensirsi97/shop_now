import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget senderBubble() {
  return Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.only(bottom: 8),
    decoration: const BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    ),
    child: Column(
      children: [
        const Text(
          'Message here...',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        10.heightBox,
        const Text(
          '03:45 Pm',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    ),
  );
}
