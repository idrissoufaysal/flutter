

 import 'dart:ui';

import 'package:flutter/material.dart';


  

void showSnackBar(BuildContext context, String message, Color? couleur) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      SnackBar(
        backgroundColor: couleur,
        content: Text(message),
        duration: Duration(seconds: 2),
        // Durée pendant laquelle la SnackBar est affichée
      ),
    );
  }
