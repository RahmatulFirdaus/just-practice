import 'package:flutter/material.dart';

class Widgetexpandedflexiblepage extends StatefulWidget {
  const Widgetexpandedflexiblepage({super.key});

  @override
  State<Widgetexpandedflexiblepage> createState() => _WidgetexpandedflexiblepageState();
}

class _WidgetexpandedflexiblepageState extends State<Widgetexpandedflexiblepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Ekspen()
    );
  }

  Column Ekspen() {
    return Column(
      children: [
        Text("Perbedaan Flexible dan Expanded adalah widget Flexible memungkinkan child widget-nya berukuran lebih kecil dibandingkan ukuran ruang yang tersisa. Sementara, child widget dari Expanded harus menempati ruang yang tersisa dari Column atau Row."),
        Expanded(
          child: Container(
            width: 50,
            // height: 50,
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Container(
            width: 50,
            // height: 50,
            color: Colors.green,
          ),
        ),
        Expanded(
          child: Container(
            width: 50,
            // height: 50,
            color: Colors.blue
          ),
        ),
        Expanded(
          child: Container(
            width: 50,
            // height: 50,
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Container(
            width: 50,
            // height: 50,
            color: Colors.green,
          ),
        ),
        Expanded(
          child: Container(
            width: 50,
            // height: 50,
            color: Colors.blue
          ),
        ),
      ],
    );
  }
}