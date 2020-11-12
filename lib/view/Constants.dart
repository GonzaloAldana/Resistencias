import 'package:flutter/material.dart';
import 'package:resistencias/model/ResistanceColor.dart';

class Constants {
  static List<ResistanceColor> ColorList = [
    ResistanceColor(color: Colors.black, name: 'Black', digit: 0),
    ResistanceColor(color: Colors.brown, name: 'Brown', digit: 1),
    ResistanceColor(color: Colors.red, name: 'Red', digit: 2),
    ResistanceColor(color: Colors.orange, name: 'Orange', digit: 3),
    ResistanceColor(color: Colors.yellow, name: 'Yellow', digit: 4),
    ResistanceColor(color: Colors.green, name: 'Green', digit: 5),
    ResistanceColor(color: Colors.blue, name: 'Blue', digit: 6),
    ResistanceColor(color: Colors.purple, name: 'Purple', digit: 7),
    ResistanceColor(color: Colors.grey, name: 'Grey', digit: 8),
    ResistanceColor(color: Colors.white, name: 'White', digit: 9),
  ];

  static List<ResistanceColor> ToleranceColorList = [
    ResistanceColor(color: Colors.brown, name: 'Brown', digit: 100),
    ResistanceColor(color: Colors.red, name: 'Red', digit: 200),
    ResistanceColor(color: Colors.green, name: 'Green', digit: 50),
    ResistanceColor(color: Colors.blue, name: 'Blue', digit: 25),
    ResistanceColor(color: Colors.purple, name: 'Purple', digit: 10),
    ResistanceColor(color: Colors.grey, name: 'Grey', digit: 5),
    ResistanceColor(color: Colors.yellow[300], name: 'Gold', digit: 500),
    ResistanceColor(color: Colors.blueGrey, name: 'Silver', digit: 1000),
  ];
}
