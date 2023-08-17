import 'package:renteasy/firstPage.dart';
import 'package:renteasy/pages/login_page.dart';
import 'package:renteasy/pages/signUp_page.dart';
import 'package:renteasy/pages/splash_page.dart';
import 'package:renteasy/widgets/navBar.dart';
import 'package:renteasy/widgets/news_card.dart';

import '../landing_page.dart';
import '../pages/home_page.dart';
import '../pages/message.dart';
import '../widgets/news_card.dart';

int index = 0;
  final screens = [
   //LandingPage(),
    HomePageScreen(token:null),
    Splash(),
       Message()

  ];
