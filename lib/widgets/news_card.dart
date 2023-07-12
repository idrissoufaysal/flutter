import 'package:flutter/material.dart';
import 'package:renteasy/utilises/layout_utility.dart';


class NewCardWidget extends StatelessWidget {
  const NewCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)
      ),
      child: InkWell(
        onTap: () {
          },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network('https://media.istockphoto.com/id/1443305526/fr/photo/jeune-homme-souriant-au-casque-tapant-sur-le-clavier-dun-ordinateur-portable.jpg?b=1&s=170667a&w=0&k=20&c=gp1pGEgfWEcXv_wuUXdoj1Lvi0HomYdD8MF5T-u_SRY='),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
             ),
            ),
            Align(alignment: Alignment.topRight,
            child: Container(
              padding:EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.green,
              borderRadius: BorderRadius.circular(15)),
              child:const Text('Ajouter')
              ,),
            ),
          const  Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Chambre dispo',
                  textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16,)
                  ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      //LayoutUtils.iconText(Icon(Icons.animation), Text('02 jan 2022'))
                      //LayoutUtil.iconText(Icon(Icons.timer), Text('02 01secoind'))
                    
                    ],
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}