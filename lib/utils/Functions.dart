import 'package:flutter/material.dart';
import 'package:resistencias/model/ResistanceColor.dart';

List<DropdownMenuItem<int>> listGenerator(List<ResistanceColor> list) => list
    .map((e) => DropdownMenuItem(
          value: e.digit,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: e.color,
              radius: 15,
            ),
            title: Text('${e.name} - ${e.digit}'),
          ),
        ))
    .toList();
