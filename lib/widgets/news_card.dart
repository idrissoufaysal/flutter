import 'package:flutter/material.dart';
import 'package:renteasy/components/colors.dart';
import 'package:renteasy/components/space.dart';
import 'package:renteasy/new_details.dart';
import 'package:renteasy/utilises/layout_utility.dart';

//import '../models/posts.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
 final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

    return ListView(
     children: [
      SpaceVH(height: 40,),
        Container(
          //padding: EdgeInsets.all(35),
          margin: EdgeInsets.all(30),
         
        width: width,
       height:height,
        
        color:grayText,
        
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(),
              )
          ],
        ),
        
        ),
      ],
    )
    ;
  }
}
