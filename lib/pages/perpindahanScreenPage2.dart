import 'package:flutter/material.dart';

class Perpindahanscreenpage2 extends StatefulWidget {
  const Perpindahanscreenpage2({super.key});

  @override
  State<Perpindahanscreenpage2> createState() => _Perpindahanscreenpage2State();
}

class _Perpindahanscreenpage2State extends State<Perpindahanscreenpage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Navigator pop hanya membutuhkan parameter context, fungsi navigator pop itu untuk kembali ke halaman sebelumnya yang tertumpuk", textAlign: TextAlign.center,),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                // backgroundColor: Colors.red,
                side: BorderSide(width: 2, color: Colors.green),
              ),
                onPressed: () {
                  Navigator.pop(context);
                }, child: Text("BALIK")),
          ],
        ),
      ),
    );
  }
}