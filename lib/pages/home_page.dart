import 'package:flutter/material.dart';

import '../widgets/news_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenu sur notre Application de gestion de location'),
      ),
      body: NewCardWidget(),
    );
    
  }
}