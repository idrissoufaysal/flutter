// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:renteasy/components/colors.dart';
import 'package:renteasy/components/indexes.dart';

import '../components/index.dart';





class BottomBar extends StatefulWidget {
  final int index;
  final token;

  const BottomBar({super.key, required this.index,required this.token});
  
  
  
   @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],

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
            selectedIndex:index,
            tabs: [
              GButton(
                icon: LineAwesomeIcons.home,
                text: 'Home',
                iconSize: 30,
                onPressed: () {
                  setState(() => index = 0);
                  print(index);
                },
              ),

              GButton(
                icon: Icons.home,
                text: 'Propriete',
                iconSize: 30,
                onPressed: () {
                  setState(() => index = 1);
                  print(index);
                },
              ),
             
              GButton(
                icon: LineAwesomeIcons.user_circle,
                text: 'Profile',
                iconSize: 30,
                onPressed: () {

                  setState(() => index = 2);
                  print(index);
                },
             )
,
             GButton(
                icon: LineAwesomeIcons.user,
                text: 'Profile',
                iconSize: 30,
                onPressed: () {
                  setState(() => index = 3);
                  print(index);
                },
             )
            ],
          ),
        ),
      ),
    );
  }
}