import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:renteasy/components/colors.dart';
import 'package:renteasy/components/space.dart';
import 'package:renteasy/components/text_style.dart';
import 'package:renteasy/pages/userAdd.dart';
import 'package:renteasy/widgets/main_botton.dart';

import 'add_propriete.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(LineAwesomeIcons.user_check,
             size: 50,
             color: blueButton,),
            SpaceVH(height: 20,),
            Text('Bienvenue',style: headlineDot),
SpaceVH(height: 30,),
            Mainbutton(
                onTap: () {
                Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddUser()));                }, text: 'Ajouter un Locataire', btnColor: blueText),
            SpaceVH(
              height: 30,
            ),
            Mainbutton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPropriete()));
                }, text: 'Ajouter une Propriete', btnColor: blueText)
          ],
        ),
      ),
    );
  }
}
