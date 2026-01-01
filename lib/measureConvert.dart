import 'package:flutter/material.dart';

class MeasureConverter extends StatefulWidget {
  const MeasureConverter({super.key});

  @override
  State<MeasureConverter> createState() => _MeasureConverterState();
}

class _MeasureConverterState extends State<MeasureConverter> {
  final List<String> measures = [
    'meter',
    'km',
    'gram',
    'kg',
    'feet',
    'miles',
    'pounds',
    'ounces',
  ];
  final measureMap = {
    'meter': 0,
    'km': 1,
    'gram': 2,
    'kg': 3,
    'feet': 4,
    'miles': 5,
    'pounds': 6,
    'ounces': 7,
  };
  final convertionLogic = {
    0: [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    1: [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    2: [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    3: [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    4: [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    5: [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    6: [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    7: [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
  };
  String? startMeasureFrom;
  String? startMeasureTo;
  double? valueFrom=0;
  double? valueTo;
  String msg='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Measure Converter",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            Text("Value", style: TextStyle(fontSize: 25)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  hintText: "Enter Value",
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
                onChanged: (value) {
                  valueFrom = double.parse(value);
                },
              ),
            ),
            Text("From", style: TextStyle(fontSize: 25)),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(border: BoxBorder.all(width: 1)),
              child: DropdownButton(
                isExpanded: true,
                items: measures
                    .map(
                      (value) =>
                          DropdownMenuItem(value: value, child: Text(value)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    startMeasureFrom = value;
                  });
                },
                hint: Text("Select From"),
                value: startMeasureFrom,
              ),
            ),

            Text("To", style: TextStyle(fontSize: 25)),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(border: BoxBorder.all(width: 1)),
              child: DropdownButton(
                isExpanded: true,

                items: measures
                    .map(
                      (value) =>
                          DropdownMenuItem(value: value, child: Text(value)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    startMeasureTo = value;
                  });
                },
                hint: Text("Select To"),
                value: startMeasureTo,
              ),
            ),

            ElevatedButton(
            onPressed: () {
              int nFrom=-1;
              int nTo=-1;
               nFrom =measureMap[startMeasureFrom]!;
               nTo = measureMap[startMeasureTo]!;

               valueTo = valueFrom!*convertionLogic[nFrom]![nTo];
               
               setState(() {
                if(valueTo==0){
                  msg="This operation can't be performed";
                }else{
                msg="$valueFrom $startMeasureFrom is $valueTo $startMeasureTo";
                }
               });
            }, 
            child: Text("Convert")),
            
            Text(msg,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            //DropdownButton(items: measures.map(), onChanged: onChanged)
          ],
        ),
      ),
    );
  }
}