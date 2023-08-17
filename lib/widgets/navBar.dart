import 'package:flutter/material.dart';
import 'package:renteasy/pages/home_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../components/index.dart';



class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

 


  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

//     return Container(

//         margin: EdgeInsets.all(20),
//         height: size.width * .155,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(.15),
//               blurRadius: 30,
//               offset: Offset(0, 10),
//             ),
//           ],
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: ListView.builder(
//           itemCount: 4,
//           scrollDirection: Axis.horizontal,
//           padding: EdgeInsets.symmetric(horizontal: size.width * .024),
//           itemBuilder: (context, index) => InkWell(
//             onTap: () {
//               setState(
//                 () {
//                   currentIndex = index;
//                 },
//               );
//             },
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AnimatedContainer(
//                   duration: Duration(milliseconds: 1500),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                   margin: EdgeInsets.only(
//                     bottom: index == currentIndex ? 0 : size.width * .029,
//                     right: size.width * .0422,
//                     left: size.width * .0422,
//                   ),
//                   width: size.width * .128,
//                   height: index == currentIndex ? size.width * .014 : 0,
//                   decoration: BoxDecoration(
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.vertical(
//                       bottom: Radius.circular(10),
//                     ),
//                   ),
//                 ),
//                 Icon(
//                   listOfIcons[index],
//                   size: size.width * .076,
//                   color: index == currentIndex
//                       ? Colors.blueAccent
//                       : Colors.black38,
//                 ),
//                 SizedBox(height: size.width * .03),
//               ],
//             ),
//           ),
//     )
//     );
//   }
//    List<IconData> listOfIcons = [
//     Icons.home_rounded,
//     Icons.favorite_rounded,
//     Icons.settings_rounded,
//     Icons.person_rounded,
//   ];
// }
return Container(
        color: Color.fromARGB(255, 234, 234, 234),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            color: Color.fromARGB(255, 92, 91, 91),
            activeColor: Colors.white,
            haptic: true,
            gap: 8,
            tabBorderRadius: 25,
            tabBackgroundColor: Color.fromARGB(255, 46, 47, 46),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            selectedIndex: index,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                iconSize: 30,
                onPressed: () {
                  setState(() => {index = 0});
                },
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
                iconSize: 30,
                onPressed: () {
                  setState(() => {index = 1});
                },
              ),
              GButton(
                icon: Icons.person_outline,
                text: 'Profile',
                iconSize: 30,
                onPressed: () {
                  setState(() => { index = 2 } );
                },
              )
            ],
          ),
        ),
      );
     }
  }