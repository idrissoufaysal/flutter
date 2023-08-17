import 'package:flutter/material.dart';

class LayoutUtil{

  static Widget iconText(Icon iconWidget,Text textWidget){
    return Row(
      children: [
        iconWidget,
        SizedBox(width: 5,),
        textWidget
      ],
    );
  }

}

class IconText extends StatefulWidget {
  const IconText({super.key});

  @override
  State<IconText> createState() => _IconTextState();
}

class _IconTextState extends State<IconText> {
  @override
  Widget build(BuildContext context) {
    return Row(
        
    );
  }
}