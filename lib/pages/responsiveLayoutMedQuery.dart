import 'package:flutter/material.dart';

class Responsivelayout extends StatefulWidget {
  const Responsivelayout({super.key});

  @override
  State<Responsivelayout> createState() => _ResponsivelayoutState();
}

class _ResponsivelayoutState extends State<Responsivelayout> {
  @override
  Widget build(BuildContext context) {
    //ukuran layar
    Size ukuran = MediaQuery.of(context).size;
    //orientasi atau menentukan potrait atau landscape layarnya
    Orientation orientasi = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text("Responsive Layout"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "ukuran : ${ukuran.width.toStringAsFixed(2)}",
              textAlign: TextAlign.center,
            ),
            Text(
              "Orentasi : ${orientasi}",
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
