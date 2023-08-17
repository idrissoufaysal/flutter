// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:renteasy/components/colors.dart';
import 'package:renteasy/components/index.dart';





class BottomBar extends StatefulWidget {
  final int index;
  BottomBar({Key? key, required this.index,required token}) : super(key: key);
  
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
            selectedIndex: index,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                iconSize: 30,
                onPressed: () {
                  setState(() => {index = 0});
                },
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
                iconSize: 30,
                onPressed: () {
                  setState(() => {index = 1});
                },
              ),
             
              GButton(
                icon: Icons.message,
                text: 'Profile',
                iconSize: 30,
                onPressed: () {
                  setState(() => {index = 2});
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}