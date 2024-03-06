import 'package:flutter/material.dart';
import 'package:renteasy/utility/colors.dart';

import 'package:renteasy/pages/splash_page.dart';
import 'package:renteasy/provider/authProvider/auth_provider.dart';
import 'package:renteasy/widgets/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> AuthentificationProvider())
    ],
   child: MyApp(
      token: prefs.getString('token'),
    )
    ),
  );
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({
     this.token,
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Appartement ',
        theme: ThemeData(
          textTheme: const TextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: blueButton),
          scaffoldBackgroundColor: blackBG,
        ),
        home: (token != null)
            ? BottomBar(
                index: 0,
                token: token,
              )
            : Splash()
// && JwtDecoder.isExpired(token!) == false
        //home:
        //Plaintes()
        //SignUpPage()nn
        //BottomBar(index: 0),
        //Message()
        );
  }
}
