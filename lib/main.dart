import 'package:flutter/material.dart';
import 'package:measure_converter/measureConvert.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(

      home: MeasureConverter(),
      title: "Measure Conveter",
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blueGrey)),
    );
  }
}