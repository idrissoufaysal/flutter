import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:renteasy/components/colors.dart';
import 'package:renteasy/pages/chat_screen.dart';
import 'package:renteasy/pages/message.dart';

import 'Api/service_Api.dart';
import 'N_widget/filter_widget.dart';
import 'N_widget/imageWidget.dart';
import 'N_widget/menu_widget.dart';
import 'components/homeStatique.dart';
import 'models/homeData.dart';
import 'models/home_models.dart';

class HomePageScreen extends StatefulWidget {
  final String? token;
  const HomePageScreen({ this.token, Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  ///nodeApi
  List<dynamic> _homes = [];
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadHomes();
    Map<String,dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token!);
    userId = jwtDecodedToken['id'];
  }

  Future<void> _loadHomes() async {
      setState(() {
        isLoading=true;
      });

    try {
      final homes = await ApiServices().getHomes();
      setState(() {
        _homes = homes;
        isLoading = false;
        errorMessage = '';
      });
    } catch (e) {
      setState(() {
        isLoading=false;
        errorMessage='une erreur s\est produite lors de la recuperation des maison';
      });
    }
  }

  ///nodeApi

  final filterArray = [
    "Tout",
    "Maison",
    "villa",
    "Appartement",
    "Chambre",
  ];

  late String userId;

  List? items;

/////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: black,
      ),
    );

    return Scaffold(
      
      drawer: Drawer(),
      backgroundColor: Colors.grey[200],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body:  SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 35,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

          ///* Les Appbar//////////////////////////////              
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            MenuWidget(
                              iconImg: Icons.subject,
                              iconColor: black,
                              conBackColor: white,
                              onbtnTap: () {},
                            ),
                            MenuWidget(
                              iconImg: Icons.message_outlined,
                              iconColor: black,
                              conBackColor: white,
                              onbtnTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatScreen()));
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "RentEasy",
                          style: GoogleFonts.notoSans(
                            fontSize: 16,
                            color: grayText,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Bienvenue",
                          style: GoogleFonts.notoSans(
                            fontSize: 34,
                            color: blueButton,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Divider(
                          color: grayText,
                          thickness: .2,
                        ),
                        Container(
                          height: 50,
                          child: ListView.builder(
                            shrinkWrap: false,
                            scrollDirection: Axis.horizontal,
                            itemCount: filterArray.length,
                            itemBuilder: (context, index) {
                              return FilterWidget(
                                filterTxt: filterArray[index],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        ///Listes des maisons
                        Column(
                          children: List.generate(
                            _homes.length,
                            (index) {
                              //final maison=_homes[index];
                              return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ImageWidget(_homes[index]));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
