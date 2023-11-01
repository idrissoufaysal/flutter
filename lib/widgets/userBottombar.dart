// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:renteasy/components/colors.dart';
import 'package:renteasy/components/indexes.dart';

import '../components/index.dart';





class UserBottomBar extends StatefulWidget {
  final int indexes;
  UserBottomBar({Key? key, required this.indexes,required token}) : super(key: key);
  
  
   @override
  State<UserBottomBar> createState() => _UserBottomBarState();
}

class _UserBottomBarState extends State<UserBottomBar> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screense[indexes],
      bottomNavigationBar: Container(
        //couleur du backgroundColors
        color:blackBG,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            color: white,
            activeColor: white,
            haptic: true,
            gap: 8,
            tabBorderRadius: 25,
            tabBackgroundColor: blueButton,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            selectedIndex: indexes,
            tabs: [
              
              GButton(
                icon: Icons.home,
                text: 'Propriete',
                iconSize: 30,
                onPressed: () {
                  setState(() => indexes = 0);
                },
              ),
             
              GButton(
                icon: LineAwesomeIcons.user_circle,
                text: 'Profile',
                iconSize: 30,
                onPressed: () {

                  setState(() => indexes = 1);

                },
             )
,
             GButton(
                icon: LineAwesomeIcons.user,
                text: 'Profile',
                iconSize: 30,
                onPressed: () {
                  setState(() => indexes = 2);
                },
             )
            ],
          ),
        ),
      ),
    );
  }
}