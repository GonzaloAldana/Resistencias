import 'package:flutter/material.dart';

class GenericDropdown extends StatefulWidget {
  GenericDropdown({Key key, this.items, this.callback, this.hint = ''})
      : super(key: key);

  final List<DropdownMenuItem> items;
  final Function callback;
  final String hint;

  @override
  _GenericDropdownState createState() => _GenericDropdownState();
}

class _GenericDropdownState extends State<GenericDropdown> {
  var selectedVal;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text(widget.hint),
      isExpanded: true,
      items: widget.items,
      onChanged: (value) {
        setState(() {
          selectedVal = value;
        });
        widget.callback(value);
      },
      value: selectedVal,
    );
  }
}
