// No Filter: Identity Matrix
import 'package:flutter/material.dart';
import 'package:flutter_story_editor/flutter_story_editor.dart';

const noFiler = [
  1.0, 0.0, 0.0, 0.0, 0.0,
  0.0, 1.0, 0.0, 0.0, 0.0,
  0.0, 0.0, 1.0, 0.0, 0.0,
  0.0, 0.0, 0.0, 1.0, 0.0
];

// Black & White
const blackAndWhiteFilter = [
  0.3, 0.6, 0.1, 0.0, 0.0,
  0.3, 0.6, 0.1, 0.0, 0.0,
  0.3, 0.6, 0.1, 0.0, 0.0,
  0.0, 0.0, 0.0, 1.0, 0.0
];


// Pop: Increase saturation
const popFilter = [
  1.3, 0.0, 0.0, 0.0, 0.0,
  0.0, 1.3, 0.0, 0.0, 0.0,
  0.0, 0.0, 1.3, 0.0, 0.0,
  0.0, 0.0, 0.0, 1.0, 0.0
];

// Cool: Add a blue tint
const coolFilter = [
  1.0, 0.0, 0.0, 0.0, 0.0,
  0.0, 1.0, 0.0, 0.0, 0.0,
  0.0, 0.0, 1.2, 0.0, 0.0,
  0.0, 0.0, 0.0, 1.0, 0.0
];

// Chrome: Increase contrast
const chromeFilter = [
  1.5, 0.0, 0.0, 0.0, -0.2,
  0.0, 1.5, 0.0, 0.0, -0.2,
  0.0, 0.0, 1.5, 0.0, -0.2,
  0.0, 0.0, 0.0, 1.0, 0.0
];

// Film: Decrease saturation
const filmFilter = [
  0.8, 0.2, 0.2, 0.0, 0.0,
  0.2, 0.8, 0.2, 0.0, 0.0,
  0.2, 0.2, 0.8, 0.0, 0.0,
  0.0, 0.0, 0.0, 1.0, 0.0
];

final List<Color> textFilterColors = [
  Colors.white,
  Colors.black,
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple, // Violet
  Colors.brown,
];

String? packageName = FlutterStoryEditor.assetPackageName;

List<TextStyle> fontStyles = [
  TextStyle(fontFamily: 'Roboto', color: Colors.white, package:packageName),
  TextStyle(fontFamily: 'Merriweather', color: Colors.white, package:packageName),
  TextStyle(fontFamily: 'Madimi One', fontWeight: FontWeight.bold, color: Colors.white, package:packageName),

  // Serif fonts (with small "tails" on letters):
  TextStyle(fontFamily: 'Dancing Script', color: Colors.white, package:packageName),
  TextStyle(fontFamily: 'Angkor', color: Colors.white, package:packageName),
  TextStyle(fontFamily: 'Pacifico', color: Colors.white, package:packageName),

  // Sans-serif fonts (clean, without tails):
  TextStyle(fontFamily: 'Montserrat', color: Colors.white, package:packageName),
  TextStyle(fontFamily: 'Lato', color: Colors.white, package:packageName),

  // More stylized choices:
  TextStyle(fontFamily: 'Oswald', color: Colors.white, package:packageName),
  TextStyle(fontFamily: 'Raleway', color: Colors.white, package:packageName),
  TextStyle(fontFamily: 'Lora', color: Colors.white, package:packageName),
];
