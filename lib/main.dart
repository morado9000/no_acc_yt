import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(image: '', name: ''),
              ButtonSection(title: "", image: "", views: ""),
            ],
          )
        ),
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