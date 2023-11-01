import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renteasy/firstPage.dart';
import 'package:renteasy/pages/signUp_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:renteasy/widgets/userBottombar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/config.dart';
import '../components/colors.dart';
import '../components/space.dart';
import '../components/text_style.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/main_botton.dart';
import '../widgets/text_fild.dart';
import 'home_page.dart';

class UserLoginPAge extends StatefulWidget {
  const UserLoginPAge({Key? key}) : super(key: key);

  @override
  _UserLoginPAge createState() => _UserLoginPAge();
}

class _UserLoginPAge extends State<UserLoginPAge> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isNotValidate = false;
  late SharedPreferences prefs;
  String error='';

  ////////////////////////////////*
  bool isAPIcallProcess=false;
  bool hidePassword=true;
  String? email;
  String? password;
  GlobalKey<FormState> globalKey= GlobalKey<FormState>();
  //////////////////////////////*

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

//////////////////////////////////?
  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }
//////////////////////////////////?

//*Fonction de login
  void _login() async{
    if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){

      var LoginBody = {
        "email":_emailController.text,
        "password":_passwordController.text
      };

      var response = await http.post(Uri.parse(Login),
          headers: {"Content-Type":"application/json"},
          body: jsonEncode(LoginBody)
      );

      var jsonResponse = jsonDecode(response.body);
      
      if(jsonResponse['status']){
          var myToken = jsonResponse['token'];
          prefs.setString('token', myToken);
          showSnackBar(context,'vous etes connecter',Colors.green);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>UserBottomBar(token: myToken, indexes: 0,) ));
      }else{
        setState(() {
          print(jsonResponse['status']);
        error=jsonResponse['error'];
        });
        print(error);
        showSnackBar(context,error,Colors.red);
      };
  }  

 }

   

  //  @override
  // Widget build(BuildContext context) {
  //   return SafeArea(child: Scaffold(
  //     backgroundColor: blackBG,
  //     body: ProgressHUD(
  //       child:
  //     ),
  //   ));
  // }


// Fonction pour afficher une SnackBar
void showSnackBar(BuildContext context, String message,Color couleur) {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: Padding(
        padding:const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
             const SpaceVH(height: 50.0),
             const Text(
                'Bienvenu !',
                style: headline1,
              ),
           const   SpaceVH(height: 10.0),
            const  Text(
                'Connecter-vous a votre compte',
                style: headline3,
              ),
            const  SpaceVH(height: 60.0),
              textFild(
                controller: _emailController,
                image: 'user.svg',
                hintTxt: 'adress email',
                isNotValidate:_isNotValidate

              ),
              textFild(
                controller: _passwordController,
                image: 'hide.svg',
                isObs: true,
                hintTxt: 'mot de pass',
                isNotValidate:_isNotValidate
              ),
            const  SpaceVH(height: 10.0),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding:const EdgeInsets.only(right: 20.0),
                  child: TextButton(
                    onPressed: () {},
                    child:const Text(
                      'Mot de pass oublier ?',
                      style: headline3,
                    ),
                  ),
                ),
              ),
            const  SpaceVH(height: 60.0),

              //Boutton de Login
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Mainbutton(
                      onTap:(){
                      //? showSnackBar(context,error):null;
                        _login();
                      },
                      text: 'Se connecter',
                      btnColor: blueButton,
                      
                    ),
                 const   SpaceVH(height: 20.0),

                  //Connection avec google
                    Mainbutton(
                      onTap: (){},
                      text: 'contunier avec google',
                      image: 'google.png',
                      btnColor: white,
                      txtColor: blackBG,
                    ),
                  const  SpaceVH(height: 20.0),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
  

