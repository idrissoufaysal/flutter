import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utility/colors.dart';
import '../components/text_style.dart';

Widget textFild({
  required String hintTxt,
  String? image,
  int? ligne,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyBordType,
  bool isNotValidate = false,
}) {
  return Container(
    height: 70.0,
    padding: EdgeInsets.symmetric(horizontal: 30.0),
    margin: EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10.0,
    ),
    decoration: BoxDecoration(
      color: blackTextFild,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 270.0,
          child: TextField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObs,
            keyboardType: keyBordType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintTxt,
              hintStyle: hintStyle,
              errorText: isNotValidate ? "Veillez remplire le champ" : null,
            ),
            style: headline2,
          ),
        ),
        SvgPicture.asset(
          'assets/icon/$image',
          height: 20.0,
          color: grayText,
        )
      ],
    ),
  );
}
