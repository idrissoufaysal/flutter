import 'package:flutter/material.dart';
import 'package:renteasy/firstPage.dart';
import 'package:renteasy/pages/signUp_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/config.dart';
import '../components/colors.dart';
import '../components/space.dart';
import '../components/text_style.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/main_botton.dart';
import '../widgets/text_fild.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isNotValidate = false;
  late SharedPreferences prefs;

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

  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }

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
          Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBar(token: myToken, index: 0,) ));
      }else{
        print('Something went wrong');
      }

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
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) =>const SignUpPage()));
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'vous n\'avez pas de compte? ',
                            style: headline.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: ' S\'inscrire',
                            style: headlineDot.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                        ]),
                      ),
                    )
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