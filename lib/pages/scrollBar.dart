import 'package:flutter/material.dart';

class ScrollbarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scrollbar dengan ListView'),
        ),
        body: Scrollbar(
          child: Container(
            padding: EdgeInsets.all(9),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 50,
              itemBuilder: (context, index) {
                return Card(
                  child: Text("Halo"),
                );
              },
            ),
          ),
        ));
  }
}
