import 'package:flutter/material.dart';
import 'package:renteasy/components/colors.dart';
import 'package:renteasy/components/space.dart';
import 'package:renteasy/components/text_style.dart';
import 'package:renteasy/widgets/main_botton.dart';

import '../widgets/text_fild.dart';

class Plaintes extends StatefulWidget {
  const Plaintes({super.key});

  @override
  State<Plaintes> createState() => _PlaintesState();
}

class _PlaintesState extends State<Plaintes> {
  TextEditingController plainte = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SpaceVH(
                height: 50,
              ),
              Text('Faire une declaration de plainte', style: headline1),
              
              SpaceVH(height: 30),

              Icon(Icons.build,
              size: 60,
              color: white,),
              
              SpaceVH(height: 30),


              textFild(
                hintTxt: "Enter la plainte....", 
                controller: plainte
                ),
              SpaceVH(
                height: 30,
              ),
              textFild(
                hintTxt: 'Description....', 
                controller: description,
                ligne:2
                ),
              
              SpaceVH(
                height: 70,
              ),
                Mainbutton(
                  onTap: (){}, 
                  text: 'Soumettre la plainte', 
                  
                  btnColor: blueButton)
            ],
          ),
        ),
      ),
    );
  }
}
