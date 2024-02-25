import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:renteasy/pages/home_page.dart';
import 'package:renteasy/pages/login_page.dart';
import 'dart:convert';
import 'dart:math';

import '../Api/config.dart';
import '../components/colors.dart';
import '../components/space.dart';
import '../components/text_style.dart';
import '../widgets/main_botton.dart';
import '../widgets/text_fild.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneContoller = TextEditingController();

  bool _isNotValidate = false;
  //fonction de register
  void _register() async {
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

      var response = await http.post(Uri.parse(AdminRegistration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(registerBody));

      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse['status']);

      if (jsonResponse['status']) {
        
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage(),),);
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
      backgroundColor: blackBG,
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpaceVH(height: 40.0),
              Text(
                'Creer votre compte',
                style: headline1,
              ),
              SpaceVH(height: 10.0),
              Text(
                'Remplissez le formulaire',
                style: headline3,
              ),
              SpaceVH(height: 40.0),

              //*Champ de Nom
              Form(
                key:formKey,
                child: textFild(
                  controller: _nameController,
                  image: 'user.svg',
                  keyBordType: TextInputType.name,
                  hintTxt: 'Nom',
                  isNotValidate:_isNotValidate

                ),
              ),

              //*Champ de Prenom
              textFild(
                  controller: _prenomController,
                  image: 'user.svg',
                  keyBordType: TextInputType.name,
                  hintTxt: 'Prenom',
                  isNotValidate:_isNotValidate
                ),

              //*Champ de l'address Email
              textFild(
                controller: _emailController,
                keyBordType: TextInputType.emailAddress,
                image: 'user.svg',
                hintTxt: 'Adress Email',
                isNotValidate:_isNotValidate
              ),

              //*Champ de numer de telephen
              textFild(
                controller: _phoneContoller,
                image: 'user.svg',
                keyBordType: TextInputType.phone,
                hintTxt: 'Telephone',
                isNotValidate:_isNotValidate
              ),

              //*Champ de mote de pass
              textFild(
                controller: _passwordController,
                isObs: true,
                image: 'hide.svg',
                hintTxt: 'mot de pass',
                isNotValidate:_isNotValidate
              ),
              SpaceVH(height: 60.0),

              //*Boutton s'inscrire
              Mainbutton(
                onTap: () {
                  _register();
                  print('hello');
                },
                text: 'S\'inscrire',
                btnColor: blueButton,
              ),
              SpaceVH(height: 20.0),

              //
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'vous avez dejas un compte? ',
                      style: headline.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                    TextSpan(
                      text: ' Se connecter',
                      style: headlineDot.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
