import 'dart:math';

import 'package:flutter/material.dart';
import 'package:resistencias/model/ResistanceColor.dart';
import 'package:resistencias/view/atoms/GenericDropdown.dart';
import 'package:resistencias/view/atoms/ResponsiveContainer.dart';

import 'Constants.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String result = '';
  int first = 0, second = 0, power = 0, tol = 1;
  Color firstColor = Colors.white,
      secondColor = Colors.white,
      powerColor = Colors.white,
      tolColor = Colors.white;

  void calculate() {
    var tmp = pow(((first * 10) + second), power);
    setState(() {
      result = tmp.toString();
    });
  }

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

  var listaCompleta, listaTol;

  @override
  void initState() {
    super.initState();
    listaCompleta = listGenerator(Constants.ColorList);
    listaTol = listGenerator(Constants.ToleranceColorList);
  }

  @override
  Widget build(BuildContext context) {
    var resistanceImg = Container(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 30,
            color: firstColor,
          ),
          Container(
            width: 30,
            color: secondColor,
          ),
          Container(
            width: 30,
            color: powerColor,
          ),
          Container(
            width: 30,
            color: tolColor,
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Resistance calculator'),
      ),
      body: Center(
        child: ResponsiveContainer(Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            resistanceImg,
            GenericDropdown(
              items: listaCompleta,
              hint: '1st Digit',
              callback: (val) {
                first = val;
                calculate();
                setState(() {
                  firstColor = Constants.ColorList[val].color;
                });
              },
            ),
            GenericDropdown(
              items: listaCompleta,
              hint: '2nd Digit',
              callback: (val) {
                second = val;
                calculate();
                setState(() {
                  secondColor = Constants.ColorList[val].color;
                });
              },
            ),
            GenericDropdown(
              items: listaCompleta,
              hint: 'Power',
              callback: (val) {
                tol = val;
                calculate();
                setState(() {
                  powerColor = Constants.ColorList[val].color;
                });
              },
            ),
            GenericDropdown(
              items: listaTol,
              hint: 'Tolerance',
              callback: (val) {
                tol = val;
                calculate();
                setState(() {
                  tolColor = Constants.ToleranceColorList.firstWhere(
                      (element) => element.digit == val).color;
                });
              },
            ),
            Text('$result ohms, ${tol / 100}% tolerance')
          ],
        )),
      ),
    );
  }
}
