import 'package:flutter/material.dart';

Widget orderStatus({icon, color, title, showDone}) {
  return ListTile(
    leading: Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    ),
    trailing: SizedBox(
      width: 120,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),
          ),
          showDone
              ? const Icon(
                  Icons.file_download_done,
                  color: Colors.green,
                )
              : Container(),
        ],
      ),
    ),
  );
}
