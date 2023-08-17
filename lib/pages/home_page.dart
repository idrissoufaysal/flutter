import 'package:flutter/material.dart';
import 'package:renteasy/components/colors.dart';
import 'package:renteasy/components/space.dart';
import 'package:renteasy/components/text_style.dart';
import 'package:renteasy/pages/login_page.dart';
import 'package:renteasy/pages/message.dart';
import 'package:renteasy/pages/signUp_page.dart';
import 'package:renteasy/pages/splash_page.dart';
import 'package:renteasy/widgets/app_bar.dart';
import 'package:renteasy/widgets/navBar.dart';

import '../components/index.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required token});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//   int index=0;
// final screens = [
//     SignUpPage(),
//     Splash(),
//     LoginPage(),
    
//   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        
        title: Text('RentEasy',style: headline,),
        actions: [
           IconButton(onPressed: (){},
           icon: Icon(Icons.search)),
           SpaceVH(width: 15,),

           IconButton(onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (builder) => Message()));
           },
           icon: Icon(Icons.message)),
           SpaceVH(width: 15,),
           ],
          backgroundColor: blueButton,
          ),
       body: Center(
        child: Text('Home page',
        style: headline2,),
       ),
       // backgroundColor:grayText,
      //bottomNavigationBar: BottomBar(),
    );
  }
}
