import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:renteasy/components/colors.dart';
import 'package:renteasy/pages/chat_screen.dart';
import 'package:renteasy/pages/paiement.dart';

import '../Api/config.dart';
import '../N_widget/house_widget.dart';
import '../N_widget/menu_widget.dart';
import '../components/text_style.dart';
import '../widgets/main_botton.dart';

class ItemDetailScreen extends StatelessWidget {
  final dynamic home;
  ItemDetailScreen(
    this.home
  );
  final houseArray = [
    "1",
    "2",
    "3",
    "4",
    "5"
    
  ];
  final typeArray = [
    "Garage",
    "wc douche",
    "cuisine",
    "Garage",
    "veranda",
  ];

  String getRealPath(String oldPath) {
    return oldPath.split("public").last;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    //final oCcy = new NumberFormat("##,##,###", "en_INR");
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
      ),
    );
    return Scaffold(
      backgroundColor:Colors.grey[300],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 0,
        ),
        width: screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
          
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 25, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 0, bottom: 10),
                    child: SizedBox(
                      height: 200.0,
                      width: screenWidth,
                      child: AnotherCarousel(
                      //////////*Style du caroussel  
                        showIndicator: true,
                        borderRadius: false,
                        moveIndicatorFromBottom: 180.0,
                        noRadiusForIndicator: true,
                        overlayShadow: false,
                        overlayShadowColors: Colors.white,
                        overlayShadowSize: 0.7,
                     ////*//////*////////////////////////////////*
                     
                     //////TODOdefilement des images   
                       images: home['images'].map<Widget>((image) {
                    final imageUrl = getRealPath(image['Homeimages']);
                    return Image.network('$Api_url/$imageUrl', fit: BoxFit.cover);
                  }).toList(),   

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 15,
                      left: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MenuWidget(
                            iconImg: Icons.arrow_back,
                            iconColor: white,
                            conBackColor: Colors.transparent,
                            onbtnTap: () {
                              Navigator.of(context).pop(false);
                            }),
                        MenuWidget(
                          iconImg: Icons.favorite_border,
                          iconColor: white,
                          conBackColor: Colors.transparent,
                           onbtnTap: () {  },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                   ////* le Prix de la maison     
                        Text(
                          '\FCFA ' + "${(home['price'])}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),

                    ////* l'Adress de la maison
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Icon(Icons.place_outlined),
                              Text(
                                 home['adress'],
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        height: 45,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Colors.blueGrey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "20 hours ago",
                          style: headline3,
                               // ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                  left: 15,
                ),
                child: Text(
                  "Detaille de la maison",
                  style: GoogleFonts.notoSans(
                    fontSize: 20,
                    color: grayText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: 110,
                child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: typeArray.length,
                  itemBuilder: (context, index) {
                    final imageUrl = getRealPath(home['images'][index]['Homeimages']);
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      
                      child: HouseWidget(
                        type: typeArray[index],
                        number: houseArray[index].toString(),
                      ),
                    );
                  },
                ),
              ),

              Container(
                  child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20,
                  bottom: 20,
                ),

            //*description de la maison    
                child: Text(
                  home['desc'],
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.notoSans(
                    fontSize: 15,
                    color: black,
                  ),
                ),
              )),

 Mainbutton(onTap: () {
  Navigator.push(context, MaterialPageRoute(builder: (context)=> Paiement()));
   },
 text: 'Effectuer un paiement',
 btnColor: blueButton,
 ico: Icon(LineAwesomeIcons.facebook_messenger,
 color: white,),
 
 )

            ],
          ),
        ),
      ),
    );
  }
}
