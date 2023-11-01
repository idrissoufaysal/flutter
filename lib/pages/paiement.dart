import 'package:flutter/material.dart';
import 'package:renteasy/components/text_style.dart';

import '../N_widget/menu_widget.dart';
import '../components/colors.dart';

class Paiement extends StatefulWidget {
  const Paiement({super.key});

  @override
  State<Paiement> createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: 
      Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: MenuWidget(
                            iconImg: Icons.arrow_back,
                            iconColor: white,
                            conBackColor: Colors.transparent,
                            onbtnTap: () {
                              Navigator.of(context).pop(false);
                            }
                        ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text('Entrer les informations pour valider le paiement',
                style: headline,)
              ],
            ),
            )
        ],
      ),

    );
  }
}