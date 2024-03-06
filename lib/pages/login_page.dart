import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renteasy/pages/signUp_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:renteasy/provider/authProvider/auth_provider.dart';
import 'package:renteasy/utility/showMessage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/config.dart';
import '../utility/colors.dart';
import '../components/space.dart';
import '../components/text_style.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/main_botton.dart';
import '../widgets/text_fild.dart';

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
  String error = '';

  ////////////////////////////////*
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  String? email;
  String? password;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  //////////////////////////////*

  @override
  void initState() {
    
    super.initState();
    initSharedPref();
  }

//////////////////////////////////?
  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }
//////////////////////////////////?

//*Fonction de login
  void _login() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      var LoginBody = {
        "email": _emailController.text,
        "password": _passwordController.text
      };

      try {
        var response = await http.post(Uri.parse(Login),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(LoginBody));

        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (response.statusCode == 200) {
          var myToken = jsonResponse['token'];
          prefs.setString('token', myToken);
          showSnackBar(context, 'vous etes connecter', Colors.green);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomBar(
                token: myToken,
                index: 0,
              ),
            ),
          );
        } else {
          setState(() {
            print(jsonResponse['status']);
            error = jsonResponse['message'];
          });
          print(error);
          showSnackBar(context, error, Colors.red);
        }
      } catch (e) {
        print(e);
      }
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SpaceVH(height: 50.0),
              const Text(
                'Bienvenu !',
                style: headline1,
              ),
              const SpaceVH(height: 10.0),
              const Text(
                'Connecter-vous a votre compte',
                style: headline3,
              ),
              const SpaceVH(height: 60.0),
              textFild(
                  controller: _emailController,
                  image: 'user.svg',
                  hintTxt: 'adress email',
                  isNotValidate: _isNotValidate,
                  keyBordType: TextInputType.emailAddress),
              textFild(
                  controller: _passwordController,
                  image: 'hide.svg',
                  isObs: true,
                  hintTxt: 'mot de pass',
                  isNotValidate: _isNotValidate,
                  keyBordType: TextInputType.visiblePassword),
              const SpaceVH(height: 10.0),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Mot de pass oublier ?',
                      style: headline3,
                    ),
                  ),
                ),
              ),
              const SpaceVH(height: 60.0),

              //Boutton de Login
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Consumer<AuthentificationProvider>(
                      builder: (context, auth, child) {
                        return Mainbutton(
                          onTap: () {
                            //? showSnackBar(context,error):null;
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              showSnackBar(context, 'Remplir tous les chams',
                                  null);
                            } else {
                         //  final loginUser =   auth.login(
                           //       email: _emailController.text.trim(),
                             //     password: _passwordController.text.trim());
                               //  showSnackBar(context, auth.resMessage, Color.fromARGB(255, 172, 130, 3));
                            _login();
                            }
                            print('user login');
                          },
                          text: 'Se connecter',
                          btnColor: blueButton,
                        );
                      },
                    ),
                    const SpaceVH(height: 20.0),

                    //Connection avec google
                    Mainbutton(
                      onTap: () {},
                      text: 'contunier avec google',
                      image: 'google.png',
                      btnColor: white,
                      txtColor: blackBG,
                    ),
                    const SpaceVH(height: 20.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const SignUpPage()));
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
