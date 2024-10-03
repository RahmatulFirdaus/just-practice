import 'package:flutter/material.dart';

class IconButtonPage extends StatefulWidget {
  const IconButtonPage({super.key});

  @override
  State<IconButtonPage> createState() => _IconButtonPageState();
}

class _IconButtonPageState extends State<IconButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.red,),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.volume_up,
              size: 80,
            ),
            Container(
              height: 10,
              color: Colors.black,
            ),
            IconButton(
                tooltip: "Tingkatkan Volume",
                onPressed: () {
                  print("Print Icon Button");
                },
                icon: const Icon(
                  Icons.volume_up,
                  size: 80,
                )),
            Container(
              height: 10,
              color: Colors.black,
            ),
            GestureDetector(
              onTap: (){
                print("Print Gesture Detector");
              },
              child: SizedBox(
                // color: Colors.green,
                width: 80,
                height: 80,
                child: const Icon(Icons.volume_up, size: 80,),
              ),
            )
          ],
        ),
      )),
    );
  }
}
