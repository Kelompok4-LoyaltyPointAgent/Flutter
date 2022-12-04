import 'package:flutter/material.dart';
import 'package:loyalty_point_agent/utils/theme.dart';

void showTextMessage(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: navyColor,
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
