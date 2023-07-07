import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int containerCount = 0;
  int spacingCount = 0;
  final int originalSpacing = 2;

  void addContainer() {
    if (containerCount < 10) {
      setState(() {
        containerCount++;
      });
    } else {
      setState(() {
        containerCount = 0; // Reset the count back to zero
      });
    }
  }

  void addSpacing() {
    if (spacingCount < 10) {
      setState(() {
        spacingCount += 2;
      });
    } else {
      setState(() {
        spacingCount = 0;
      });
    }
  }

  double getTotalSpacing() {
    return (originalSpacing + spacingCount).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        spacing: getTotalSpacing(),
        runSpacing: 2,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: addContainer,
                  child: Text('A'),
                ),
                ElevatedButton(
                  onPressed: () {
                    addSpacing();
                  },
                  child: Text('B'),
                ),
              ],
            ),
          ),
          // Add containers based on the count
          for (int i = 1; i <= containerCount; i++)
            Container(
              height: 50,
              width: 50,
              color: Colors.red,
            ),
        ],
      ),
    );
  }
}
