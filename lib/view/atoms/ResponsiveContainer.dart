import 'package:flutter/cupertino.dart';

Container ResponsiveContainer(Widget child) =>
    Container(constraints: BoxConstraints(maxWidth: 800), child: child);
