import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  Color red = Colors.red.shade700;
  Color green = Colors.green.shade700;
  Color blue = Colors.blue.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen Fendi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Red'),
              onPressed: () {
                Colors.red.shade700;
              },
            ),
            ElevatedButton(
              child: const Text('Green'),
              onPressed: () {
                Colors.green.shade700;
              },
            ),
            ElevatedButton(
              child: const Text('Blue'),
              onPressed: () {
                Colors.blue.shade700;
              },
            ),
          ],
        ),
      ),
    );
  }
}
