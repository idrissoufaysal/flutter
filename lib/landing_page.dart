import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renteasy/components/colors.dart';
import 'Api/service_Api.dart';
import 'N_widget/borderIcons.dart';
import 'N_widget/custom_widget.dart';
import 'N_widget/filter_widget.dart';
import 'models/home_models.dart';

class LandingPage extends StatefulWidget {
  final token;

   const LandingPage({@required this.token,Key? key}) : super(key: key);
 
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<dynamic> _homes = [];
  bool isLoading=false;
  String errorMessage='';

///nodeApi
   var homes;
   @override
   void initState() {
    super.initState();
    loadHomes();
  }

  Future<void> loadHomes() async {
     homes= await HomeService().getHomes('/homes');
    setState(() {
        isLoading=true;
    });
  }

   ///nodeApi

final filterArray = [
    "Tout",
    "Maison",
    "villa",
    "Appartement",
    "Chambre",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
backgroundColor: whiteText,
  ///////////////////////////////////////////
  ///verification et chargement 
        body: 
                
////////////////////////////////////////////////////////////////
///Affichage de tous les maisons
           Container(
          width: size.width,
          height: size.height,
          child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BorderIcon(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.menu,
                          color: black,
                        ),
                      ),
                      BorderIcon(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.settings,
                          color: black,
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(20),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    "RentEasy",
                    style:  GoogleFonts.notoSans(
                  fontSize: 16,
                  color: grayText,
                ),
                  ),
                ),
                addVerticalSpace(10),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    "BIENVENUE",
                    style: GoogleFonts.notoSans(
                  fontSize: 34,
                  color: blueButton,
                  fontWeight: FontWeight.w500,
                ),
                  ),
                ),
                Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: 25,
                      color: grayText,
                    )),
                addVerticalSpace(10),
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
            addVerticalSpace(10),
                Expanded(
                  child: Padding(
                    padding: sidePadding,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: _homes.length,
                        itemBuilder: (context, index) {
                            return RealEstateItem(
                            itemData: _homes[index],
                          );
                        }),
                  ),
                ),
              ],
            ),

    ///position         
            // Positioned(
            //   bottom: 20,
            //   width: size.width,
            //   child: Center(
            //     child: OptionButton(
            //       text: "Map View",
            //       icon: Icons.map_rounded,
            //       width: size.width * 0.35,
            //     ),
            //   ),
            //  )
            ],
           ),
          )
      )
     );
    }
  }
  
      
     
    
  


class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: grayText.withAlpha(25),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key? key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => DetailPage(
        //           itemData: itemData,
        //         )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(25.0), child: Image.network(itemData["images"])),
                Positioned(
                    top: 15,
                    right: 15,
                    child: BorderIcon(
                        child: Icon(
                      Icons.favorite_border,
                      color: black,
                    )))
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text(
                  "FCFA $itemData['price']",
                  style: themeData.textTheme.headline1,
                ),
                addHorizontalSpace(10),
                Text(
                  "${itemData["adress"]}",
                  style: themeData.textTheme.bodyText2,
                )
              ],
            ),
            addVerticalSpace(10),
            Text("berdsda"
             "${itemData["typeMaison"]}  // ${itemData[""]} bathrooms / ${itemData["area"]} sqft",
             style: themeData.textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}