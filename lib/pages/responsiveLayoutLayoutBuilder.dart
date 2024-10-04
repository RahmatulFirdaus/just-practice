import 'package:flutter/material.dart';

class Responsivelayoutlayoutbuilder extends StatefulWidget {
  const Responsivelayoutlayoutbuilder({super.key});

  @override
  State<Responsivelayoutlayoutbuilder> createState() =>
      _ResponsivelayoutlayoutbuilderState();
}

class _ResponsivelayoutlayoutbuilderState
    extends State<Responsivelayoutlayoutbuilder> {
  @override
  Widget build(BuildContext context) {
    Size ukuran = MediaQuery.of(context).size;
    Orientation orientasi = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Row(
          children: [
            Expanded(child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // color: Colors.green.withOpacity(0.5),
                      child: Column(
                        children: [
                          Text(
                            "ukuran : ${ukuran.width.toStringAsFixed(2)}",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Orientasi : ${orientasi}",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            )),
            Expanded(flex: 3,child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ukuran : ${ukuran.width.toStringAsFixed(2)}",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Constraints : ${constraints.maxWidth}",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            })),
          ],
        ));
  }
}
