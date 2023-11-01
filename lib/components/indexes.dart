import 'package:renteasy/firstPage.dart';
import 'package:renteasy/pages/acceuil.dart';
import 'package:renteasy/pages/chat_screen.dart';
import 'package:renteasy/pages/login_page.dart';
import 'package:renteasy/pages/signUp_page.dart';
import 'package:renteasy/pages/splash_page.dart';
import 'package:renteasy/widgets/navBar.dart';
import 'package:renteasy/widgets/news_card.dart';

import '../landing_page.dart';
import '../models/ApiRequest.dart';
import '../pages/home_page.dart';
import '../pages/message.dart';
import '../pages/plaintes.dart';
import '../pages/profilePage.dart';
import '../pages/userAdd.dart';
import '../widgets/news_card.dart';

int indexes = 0;
final screense = [

  HomePageScreen(token: null),

  ChatScreen(),
  
  ProfilePage()
];
