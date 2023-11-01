import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renteasy/components/colors.dart';

class HouseWidget extends StatelessWidget {
  final String number;
  final String type;
  HouseWidget({
    required this.number,
    required this.type,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                18.0,
              ),
              color: Colors.blueGrey,
              border: Border.all(color: whiteText),
            ),
            child: Center(
              child: Text(
                number,
                style: GoogleFonts.notoSans(
                  fontSize: 20,
                  color: white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            type,
            style: GoogleFonts.notoSans(
              fontSize: 16,
              color: blueButton,
            ),
          ),
        ],
      ),
    );
  }
}
