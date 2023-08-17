import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://media.istockphoto.com/id/1443305526/fr/photo/jeune-homme-souriant-au-casque-tapant-sur-le-clavier-dun-ordinateur-portable.jpg?b=1&s=170667a&w=0&k=20&c=gp1pGEgfWEcXv_wuUXdoj1Lvi0HomYdD8MF5T-u_SRY=',
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            expandedHeight: 250,
          ),
          //SliverFillRemaining()
          //NewDetailsSection(),

          const SliverFillRemaining(),
         
        ],
      ),
    );
  }

  Widget NewDetailsSection() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [row1()],
      ),
    );
  }

  Widget row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: const Text('Beautee'),
            ))
      ],
    );
  }
}
