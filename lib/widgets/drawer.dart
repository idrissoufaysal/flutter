import 'package:flutter/material.dart';

class DrawerWdget extends StatefulWidget {
  const DrawerWdget({super.key});

  @override
  State<DrawerWdget> createState() => _DrawerWdgetState();
}

class _DrawerWdgetState extends State<DrawerWdget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
  

  child: ListView(

    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Drawer Header'),
      ),
      ListTile(
        title: const Text('Item 1'),
        onTap: () {
          
        },
      ),
      ListTile(
        title: const Text('Item 2'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
    ],
  ),
);
  }
}