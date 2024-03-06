import 'package:flutter/material.dart';
import 'package:renteasy/utility/colors.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}


class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: [
         SliverAppBar(
          title: Text(
            'Appartement',
            style: TextStyle(
              color: blueButton,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            IconButton(
              onPressed:(){},
               icon: Icon(Icons.search),
               iconSize: 30,
               color: black,
            ),
    
            IconButton(
              onPressed:(){},
               icon: Icon(Icons.messenger),
               iconSize: 30,
               color: black,
            )
            ],
         )
        ],
      ),
    );
  }
}