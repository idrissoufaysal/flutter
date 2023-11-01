import 'package:flutter/material.dart';
import 'package:renteasy/pages/userLoginPage.dart';

import '../components/colors.dart';
import '../components/space.dart';
import '../components/text_style.dart';
import '../widgets/main_botton.dart';
import 'login_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: height,
            color: blackBG,
            width: width,
            child: Image.asset(
              'assets/images/img2.jpg',
              height: height,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'RentEasy',
                          style: headline,
                        ),
                        TextSpan(
                          text: '.',
                          style: headlineDot,
                        ),
                      ]),
                    ),
                    SpaceVH(height: 20.0),
                    
                    const SpaceVH(height: 40.0),
                    Text('Continuer en tant :',style:headline ,),
                    const SpaceVH(height: 40.0),
                    Mainbutton(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) => UserLoginPAge()));
                      },
                      btnColor: blueButton,
                      text: 'Utilisateur',
                    ),
                    SpaceVH(height: 20.0),
                    Mainbutton(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) => LoginPage()));
                      },
                      btnColor: blueButton,
                      text: 'Proprietaire',
                    ),
                    SpaceVH(
                      height: 5,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
