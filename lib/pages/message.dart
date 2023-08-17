import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:renteasy/components/colors.dart';
import 'package:renteasy/components/space.dart';
import 'package:renteasy/components/text_style.dart';
import 'package:renteasy/widgets/chat_sample.dart';
import 'package:renteasy/widgets/checkButtom.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: ListView(
          padding: EdgeInsets.only(top:20,left: 20,right: 20,bottom: 80),
          children: [
            ChatSample(),
             ChatSample(),
              ChatSample(),
               ChatSample(),
          ],
        ),
        bottomSheet: chatBottomSheet(),
        )
        ;
  }
}
