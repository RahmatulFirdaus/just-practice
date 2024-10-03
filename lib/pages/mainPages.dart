import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: SingleChildScrollView(
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
          Image.network(
            "https://img.freepik.com/free-photo/sunny-scenery-farm-territory-with-two-barns_181624-30937.jpg",
            errorBuilder: (context, error, stackTrace) => Icon(Icons.warning),
          ),
          Judul(),
          Jarak(),
          Information(),
          Jarak(),
          Detail(),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 200,
            // color: Colors.blue,s
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                          "https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                          "https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                          "https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg")),
                ),
              ],
            ),
          )
                ],
              ),
        ));
  }

  Container Detail() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: 150,
      // color: Colors.green,
      child: Text(
        "Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Container Information() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 60,
      // color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Icon(
                Icons.calendar_month,
                size: 30,
              ),
              Text(
                "Open Everyday",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 14)),
              )
            ],
          ),
          const Column(
            children: [
              Icon(
                Icons.timelapse,
                size: 30,
              ),
              Text("09:00 - 12:00")
            ],
          ),
          const Column(
            children: [
              Icon(
                Icons.attach_money,
                size: 30,
              ),
              Text("Rp 25.000")
            ],
          )
        ],
      ),
    );
  }

  SizedBox Jarak() => const SizedBox(height: 10);

  Container Judul() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      // color: Colors.red,
      height: 40,
      child: Text(
        "Farm House Lambang",
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
