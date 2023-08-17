import 'package:flutter/material.dart';
import 'package:renteasy/components/colors.dart';
import 'package:renteasy/firstPage.dart';
import 'package:renteasy/pages/chat_screen.dart';
import 'package:renteasy/pages/home_page.dart';
import 'package:renteasy/pages/login_page.dart';
import 'package:renteasy/pages/message.dart';
import 'package:renteasy/pages/plaintes.dart';
import 'package:renteasy/pages/signUp_page.dart';
import 'package:renteasy/pages/splash_page.dart';
import 'package:renteasy/widgets/bottom_bar.dart';
import 'package:renteasy/widgets/navBar.dart';
import 'package:renteasy/widgets/news_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(token: prefs.getString('token'),));
  //runApp(const MyApp());
}


class MyApp extends StatelessWidget {
   final token;
  const MyApp({
    @required this.token,
    Key? key,
}): super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appartement ',
      theme: ThemeData(
       textTheme:const TextTheme(

       ),
        colorScheme: ColorScheme.fromSeed(seedColor:blueButton),
        scaffoldBackgroundColor:blackBG,
    ),
          home:(token != null && JwtDecoder.isExpired(token) == false )? BottomBar(token: token, index: 0 ,):Splash()

      //home:
      //Plaintes()
       //SignUpPage()
  //BottomBar(index: 0),
  //Message()
   );
  }
}


