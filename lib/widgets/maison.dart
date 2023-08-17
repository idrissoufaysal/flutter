import 'package:flutter/material.dart';

class Maison extends StatelessWidget {
  final Function() onTap;
  
  final String text;
  final String? image;
  final Color? txtColor;
  final Color btnColor;
  const Maison({super.key, required this.onTap, required this.text, this.image, this.txtColor, required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        
      ),
    );
  }
}