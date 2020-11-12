import 'dart:math';

import 'package:flutter/material.dart';
import 'package:resistencias/utils/Functions.dart';
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
  Color firstColor = Colors.white.withOpacity(0.3),
      secondColor = Colors.white.withOpacity(0.3),
      powerColor = Colors.white.withOpacity(0.3),
      tolColor = Colors.white.withOpacity(0.3);

  void calculate() {
    var tmp = pow(((first * 10) + second), power);
    setState(() {
      result = tmp.toString();
    });
  }

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
      color: Colors.deepOrange[300],
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

    var setFirst = (val) {
      first = val;
      calculate();
      setState(() {
        firstColor = Constants.ColorList[val].color;
      });
    };

    var setSecond = (val) {
      second = val;
      calculate();
      setState(() {
        secondColor = Constants.ColorList[val].color;
      });
    };

    var setPow = (val) {
      power = val;
      calculate();
      setState(() {
        powerColor = Constants.ColorList[val].color;
      });
    };

    var setTol = (val) {
      tol = val;
      calculate();
      setState(() {
        tolColor = Constants.ToleranceColorList.firstWhere(
            (element) => element.digit == val).color;
      });
    };

    var col = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        resistanceImg,
        GenericDropdown(
          items: listaCompleta,
          hint: '1st Digit',
          callback: setFirst,
        ),
        GenericDropdown(
          items: listaCompleta,
          hint: '2nd Digit',
          callback: setSecond,
        ),
        GenericDropdown(
          items: listaCompleta,
          hint: 'Power',
          callback: setPow,
        ),
        GenericDropdown(
          items: listaTol,
          hint: 'Tolerance',
          callback: setTol,
        ),
        Text('$result ohms, ${tol / 100}% tolerance')
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Resistance calculator'),
      ),
      body: Center(
        child: ResponsiveContainer(col),
      ),
    );
  }
}
