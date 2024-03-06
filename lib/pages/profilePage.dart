import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:renteasy/utility/colors.dart';
import 'package:renteasy/components/space.dart';
import 'package:renteasy/components/text_style.dart';
import 'package:renteasy/pages/login_page.dart';
import 'package:renteasy/widgets/profileMenu.dart';
import 'package:renteasy/utility/showMessage.dart';

import '../Api/service_Api.dart';

class ProfilePage extends StatefulWidget {
  final token;
  const ProfilePage({super.key, this.token});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

    late String email;

// void initState() {
//     // TODO_implement initState
//     super.initState();
//     Map<String,dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
//     email = jwtDecodedToken['email'];
//   }

  Future<void> logoutUser() async {
  try {
    await ApiServices.logout(); // Appel de la fonction de déconnexion de l'API Service
    
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    LoginPage()), (Route<dynamic> route) => false);
    showSnackBar(context, "vous etes deconnecter",null);
    
  } catch (e) {
    print('Erreur lors de la déconnexion: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              /// -- IMAGE
              /// 
              SpaceVH(height: 30,),
              Stack(

                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        // child:  Image(image: AssetImage('ddd'))),
                        child: Icon(LineAwesomeIcons.user,
                        size: 90,
                        color: white,
                        ),
                  ),
                  ),
                  
                ],
              ),
              const SizedBox(height: 10),
              Text('',style: headlineDot,),
              Text('', style:headlineDot),
              const SizedBox(height: 60),

              /// -- BUTTON
              
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(title: "Plainte", icon: LineAwesomeIcons.cog, onPress: () {
                
              }),
              //ProfileMenuWidget(title: "Billing Details", icon: LineAwesomeIcons.wallet, onPress: () {}),
              ProfileMenuWidget(title: ".....", icon: LineAwesomeIcons.user_check, onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              //ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info, onPress: () {}),
              
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                   logoutUser();
                  }),
            ],
          ),
        ),
      ),
    
    );
  }
}