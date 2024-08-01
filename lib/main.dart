
 import 'package:calculator/bmi_page.dart';
import 'package:calculator/bmis_page.dart';
import 'package:calculator/calculator_page.dart';
import 'package:calculator/tipcalcutator_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MainApp());
 }
 class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TipcalcutatorPage(),
    );
  }
 }
