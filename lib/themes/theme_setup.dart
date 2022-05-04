import 'package:flutter/material.dart';

List<ThemeData> getThemes(){
  return [
    ThemeData(colorScheme: ColorScheme.fromSwatch()),
    ThemeData(backgroundColor:Colors.blue, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent)),
  ];
}