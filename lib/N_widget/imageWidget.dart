import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:renteasy/Api/config.dart';
import 'package:renteasy/components/colors.dart';
import '../Api/service_Api.dart';
import '../models/homeData.dart';
import '../models/home_models.dart';
import '../pages/detail_home.dart';


class ImageWidget extends StatefulWidget {
  final dynamic home;

   ImageWidget(
    this.home
  );

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  // List<dynamic> _homes = [];
  // bool isLoading=false;
  // String errorMessage='';

///nodeApi
   @override
   void initState() {
    super.initState();
    //loadHomes();
  }

  // Future<void> loadHomes() async {
  //    homes= await HomeService().getHomes('/homes');
  //   setState(() {
  //       isLoading=true;
  //   });
  // }
  

String getRealPath(String oldPath) {
    return oldPath.split("public").last;
  }



  @override
  Widget build(BuildContext context) {
      final imageUrl = (widget.home['images'][0]['Homeimages']);
      final mesImage= getRealPath(imageUrl);
      print(mesImage);

    final oCcy = new NumberFormat("##,##,###", "en_INR");
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetailScreen(widget.home)
              ),
            );
          },
          child: Container(
            height: 160,
            width: screenWidth,
            padding: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                  
      //* l'url de l'image          
                image: NetworkImage(
                  '$Api_url/${mesImage}'
                  ,) 
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: whiteText,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Icon(
                      Icons.favorite_border,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 15,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "\FCFA " + "${(widget.home['price'].toString())}", 
                style: GoogleFonts.notoSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.home['typeMaison'].toString(),
                style: GoogleFonts.notoSans(
                  fontSize: 15,
                  color: blueText,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 0,
            bottom: 10,
          ),
          child: Row(
            
            children: [
              Icon(Icons.place_outlined),
              Row(
                children: [

                  Text(widget.home['adress'],
                  style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold
                  ),),
                  Text(
                        " // " +
                         widget.home['nbrChambre'].toString()+
                        " chambres " ,
                    style: TextStyle(
                      fontSize: 18,
                      
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
