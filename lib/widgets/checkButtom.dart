import 'package:flutter/material.dart';
import 'package:renteasy/components/colors.dart';
import 'package:renteasy/widgets/text_fild.dart';

class chatBottomSheet extends StatefulWidget {
  
  const chatBottomSheet({super.key});

  @override
  State<chatBottomSheet> createState() => _chatBottomSheetState();
}

class _chatBottomSheetState extends State<chatBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(color: Colors.blueGrey, boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 110, 80, 80).withOpacity(0.6),
            spreadRadius: 10,
            blurRadius: 10,
            offset: Offset(0, 9))
      ]),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              Icons.attach_file_sharp,
              color: white,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.emoji_emotions,
              color:white,
              size: 30,
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: 10),
          //   child: textFild(hintTxt: 'envoyer', controller:)
          // ),
         Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 10),
            //Boutton Envoyer
            child: IconButton(
              icon: Icon(Icons.send,
              color: Colors.green,
              size: 35,
            ),
            onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}
