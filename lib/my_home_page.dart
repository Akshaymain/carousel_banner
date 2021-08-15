import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  final Key? key;
  MyHomePage({this.key}) : super(key: key);
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>{
  List<String> imageLinks = [
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-126550428-1585245665.jpg',
    'https://www.henryford.com/-/media/henry-ford-blog/images/interior-banner-images/2017/02/shutterstock-130707287.jpg',
    'https://i.ndtvimg.com/i/2017-07/vegetables-reheating_620x350_61499152680.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        builder: (context, AsyncSnapshot<String> snapshot) {
          // if (snapshot.hasData) {
            return CarouselSlider(
              options: CarouselOptions(height: 400),
              items: imageLinks.map((imageLink) => Image.network(imageLink))
                  .toList(),
            );
          // } else {
          //   return Container();
          // }
        },
      ),
    );
  }
}