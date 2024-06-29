import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

   @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  List _items = [];
  List _avatar = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _avatar = data["avatar"];
      _items = data["videos"];
    });
  }
  
  @override
  void initState(){
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: SingleChildScrollView(
          child: 
          (_items.isNotEmpty && _avatar.isNotEmpty) ?
            Column(
            children: [
              ImageSection(image: _avatar[0]['image'], name: _avatar[0]['name']),
              ButtonSection(title: _items[0]["title"], image: _items[0]["image"], views: _items[0]["views"]),
            ],
          )
          : const Column()
        ),
      );
  }

}



class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key, required this.title, required this.image, required this.views});

  final String title;
  final String image;
  final String views;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            width: 320,
            height: 180,
            fit: BoxFit.cover,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold
            )
          ),
          Text(
            views,
            style: TextStyle(
              color: Colors.grey[500]
            )
          )
        ],
      ),
    );
  }
}


class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image, required this.name});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
          name,
          style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
       
        CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 60,
        )
      ],
    );
  }
}