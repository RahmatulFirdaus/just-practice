import 'package:flutter/material.dart';
import 'package:id_camp/pages/perpindahanScreenPage2.dart';

class Perpindahanscreenpage extends StatefulWidget {
  const Perpindahanscreenpage({super.key});

  @override
  State<Perpindahanscreenpage> createState() => _PerpindahanscreenpageState();
}

class _PerpindahanscreenpageState extends State<Perpindahanscreenpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Navigator.push memiliki dua parameter. Pertama ialah context dan yang kedua Route. Parameter context ini merupakan variabel BuildContext yang ada pada method build. Parameter route berguna untuk menentukan tujuan ke mana kita akan berpindah screen. Route tersebut kita isikan dengan MaterialPageRoute yang di dalamnya terdapat builder yang nantinya akan diisi dengan tujuan screen-nya", textAlign: TextAlign.center,),
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  // backgroundColor: Colors.red
                  side: BorderSide(width: 2, color: Colors.green),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Perpindahanscreenpage2();
                  }));
                },
                child: Text("MENUJU HALAMAN BERIKUT")),
          ],
        ),
      ),
    );
  }
}
