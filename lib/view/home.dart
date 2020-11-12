import 'package:flutter/material.dart';
import 'package:resistencias/view/atoms/GenericDropdown.dart';
import 'package:resistencias/view/atoms/ResponsiveContainer.dart';

import 'Constants.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var listaCompleta = Constants.ColorList.map((e) => DropdownMenuItem(
        value: e.digit,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: e.color,
            radius: 15,
          ),
          title: Text('${e.name} - ${e.digit}'),
        ),
      )).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resistance calculator'),
      ),
      body: Center(
        child: ResponsiveContainer(Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GenericDropdown(
              items: listaCompleta,
              hint: '1st Digit',
              callback: (val) {
                print(val);
              },
            ),
            GenericDropdown(
              items: listaCompleta,
              hint: '2nd Digit',
              callback: (val) {
                print(val);
              },
            )
          ],
        )),
      ),
    );
  }
}
