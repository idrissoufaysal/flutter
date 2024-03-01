import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:renteasy/Api/service_Api.dart';
import 'package:renteasy/N_widget/filter_widget.dart';
import 'package:renteasy/N_widget/imageWidget.dart';
import 'package:renteasy/N_widget/menu_widget.dart';
import 'package:renteasy/components/colors.dart';
import 'package:renteasy/components/space.dart';
import 'package:renteasy/components/text_style.dart';
import 'package:renteasy/models/home_model.dart';
import 'package:renteasy/pages/profilePage.dart';
import 'package:renteasy/pages/userAdd.dart';
import 'package:renteasy/widgets/main_botton.dart';


class Acceuil extends StatefulWidget {
  final String? token;
  const Acceuil({ super.key, this.token});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
List<Homes> _homes = [];
  bool isLoading = false;
  String errorMessage = '';

 @override
  void initState() {
    super.initState();
   _loadHomes();
  // Map<String,dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token!);
   //print(jwtDecodedToken);
    //userId = jwtDecodedToken['id'];
  }

Future<void> _loadHomes() async {
      setState(() {
        isLoading=true;
      });

    try {
      final List<Homes> homes = (await ApiServices().getHomes()) as List<Homes>;
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

   
  final filterArray = [
    "Tout",
    "Maison",
    "villa",
    "Appartement",
    "Chambre",
  ];

  late String userId;

  List? items;
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
                                        builder: (context) => ProfilePage()));
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
