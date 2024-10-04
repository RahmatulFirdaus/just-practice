import 'package:flutter/material.dart';

class Responsivelayoutpractice extends StatefulWidget {
  const Responsivelayoutpractice({super.key});

  @override
  State<Responsivelayoutpractice> createState() =>
      _ResponsivelayoutpracticeState();
}

class _ResponsivelayoutpracticeState extends State<Responsivelayoutpractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text("Responsive Layout"),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Container(
                margin: EdgeInsets.all(16),
                child: constraints.maxWidth < 600
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            child: Container(
                              height: 200,
                              child: Image.network(
                                "https://cdn.discordapp.com/attachments/892554814939082793/1291784256258838628/787cc8c0af899335ed966e42b32142ec.png?ex=67015b56&is=670009d6&hm=39a8f0f7d7ac622173d8f6713df65a0d1bb5ae2056c994d3c52f775503dd1929&",
                                // fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.error,
                                    size: 50,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Welcome to Our App',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'This is a simple example of using LayoutBuilder in Flutter.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              // Action when button is pressed
                            },
                            child: Text('Get Started'),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            child: Container(
                              height: 200,
                              child: Image.network(
                                "https://cdn.discordapp.com/attachments/892554814939082793/1291784256258838628/787cc8c0af899335ed966e42b32142ec.png?ex=67015b56&is=670009d6&hm=39a8f0f7d7ac622173d8f6713df65a0d1bb5ae2056c994d3c52f775503dd1929&",
                                // fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.error,
                                    size: 50,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Welcome to Our App',
                                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'This is a more complex example of using LayoutBuilder in Flutter.',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    // Action when button is pressed
                                  },
                                  child: Text('Get Started'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            );
          },
        ),
      );
  }
}
