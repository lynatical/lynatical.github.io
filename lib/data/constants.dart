import 'package:flutter/material.dart';

const String apiKey = '3cBEFVR4qQleIRO2yWu0FcOCDdyZbuaU';

const String env = String.fromEnvironment(
  'env',
  defaultValue: 'https://rtadev-ecom.cbluna-dev.com',
);

const double minWidth = 900.0;

// Actual Screen Size
screenSize(context) {
  var screenSize = MediaQuery.of(context).size;
  return screenSize;
}

mobile(context) {
  bool mobile = screenSize(context).width < minWidth ? true : false;

  return mobile;
}

extension CapExtension on String {
  String capitalizeSentence() {
    // Each sentence becomes an array element
    var sentences = split('.');
    // Initialize string as empty string
    var output = '';
    // Loop through each sentence
    for (var sen in sentences) {
      // Trim leading and trailing whitespace
      var trimmed = sen.trim();
      // Capitalize first letter of current sentence
      var capitalized = trimmed[0].toUpperCase() + trimmed.substring(1);
      // Add current sentence to output with a period
      output += capitalized;
    }
    return output;
  }
}
