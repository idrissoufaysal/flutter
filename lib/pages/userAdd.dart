import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:renteasy/components/text_style.dart';

import '../Api/config.dart';
import '../N_widget/menu_widget.dart';
import '../components/colors.dart';
import '../components/space.dart';
import '../widgets/main_botton.dart';
import '../widgets/text_fild.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneContoller = TextEditingController();
  bool _isNotValidate = false;

  void AjoutClient() async {
    print(_nameController);
    if (_nameController.text.isNotEmpty &&
        _prenomController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _phoneContoller.text.isNotEmpty) {
      print(2);
      var registerBody = {
        "nom": _nameController.text,
        "prenom": _prenomController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
        "telephone": _phoneContoller.text
      };

      var response = await http.post(Uri.parse(Registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(registerBody));

      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse['status']);

      if (jsonResponse['status']) {
      } else {
        print("SomeThing Went Wrong");
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpaceVH(
                height: 20,
              ),
              MenuWidget(
                  iconImg: Icons.arrow_back,
                  iconColor: white,
                  conBackColor: Colors.transparent,
                  onbtnTap: () {
                    Navigator.of(context).pop(false);
                  }),
              Text(
                'Creer un Client',
                style: headlineDot,
              ),

              Form(
                child: textFild(
                    controller: _nameController,
                    image: 'user.svg',
                    keyBordType: TextInputType.name,
                    hintTxt: 'Nom',
                    isNotValidate: _isNotValidate),
              ),

              //*Champ de Prenom
              textFild(
                  controller: _prenomController,
                  image: 'user.svg',
                  keyBordType: TextInputType.name,
                  hintTxt: 'Prenom',
                  isNotValidate: _isNotValidate),

              //*Champ de l'address Email
              textFild(
                  controller: _emailController,
                  keyBordType: TextInputType.emailAddress,
                  image: 'user.svg',
                  hintTxt: 'Adress Email',
                  isNotValidate: _isNotValidate),

              //*Champ de numer de telephen
              textFild(
                  controller: _phoneContoller,
                  image: 'user.svg',
                  keyBordType: TextInputType.phone,
                  hintTxt: 'Telephone',
                  isNotValidate: _isNotValidate),

              //*Champ de mote de pass
              textFild(
                  controller: _passwordController,
                  isObs: true,
                  image: 'hide.svg',
                  hintTxt: 'mot de pass',
                  isNotValidate: _isNotValidate),
              SpaceVH(height: 60.0),

              //*Boutton s'inscrire
              Mainbutton(
                onTap: () {
                  AjoutClient();
                  print('hello');
                },
                text: 'Ajouter',
                btnColor: blueButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
