import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

import '../components/colors.dart';
import '../components/space.dart';
import '../components/text_style.dart';


class ChatSample extends StatefulWidget {
  const ChatSample({super.key});

  @override
  State<ChatSample> createState() => _ChatSampleState();
}

class _ChatSampleState extends State<ChatSample> {
  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 80),
              child: ClipPath(
                clipper: UpperNipMessageClipper(MessageType.receive),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: blueButton,
                  ),
                  child: Text(
                    "Hy , developpers comment aller vous tres cher developpeurs ?!!!",
                    style: headline2,
                  ),
                ),
              ),
            ),
            SpaceVH(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 80),
                child: ClipPath(
                  clipper: LowerNipMessageClipper(MessageType.send),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 20, top: 10, bottom: 25, right: 20),
                    decoration: BoxDecoration(
                      color: grayText,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     spreadRadius: 2,
                      //     blurRadius: 10,
                      //     offset: Offset(0, 3)
                      //   )

                      // ]
                    ),
                    child: Text(
                      "oui oui bonjour Mr comment aller -vous et je suis actuellement en train de travailler sur un truc",
                      style: headline2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
  }
}