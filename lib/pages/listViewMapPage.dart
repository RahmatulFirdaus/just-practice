import 'package:flutter/material.dart';

class Listviewmappage extends StatefulWidget {
  const Listviewmappage({super.key});

  @override
  State<Listviewmappage> createState() => _ListviewmappageState();
}

class _ListviewmappageState extends State<Listviewmappage> {
  final List numberList = [
    1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: numberList.map((number){
          return Container(
            margin: EdgeInsets.all(10),
            height: 80,
            color: Colors.red,
            child: Text("${number}"),
          );
        }).toList()
      ),
    );
  }
}