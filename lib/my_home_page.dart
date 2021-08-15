import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final Key? key;

  MyHomePage({this.key}) : super(key: key);

  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<String> imageLinks = [];
  int initialPage = 2, _currentIndex = 0 ;

  @override
  void initState() {
    super.initState();
    imageLinks = [
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-126550428-1585245665.jpg',
      'https://www.henryford.com/-/media/henry-ford-blog/images/interior-banner-images/2017/02/shutterstock-130707287.jpg',
      'https://i.ndtvimg.com/i/2017-07/vegetables-reheating_620x350_61499152680.jpg',
      'https://media.architecturaldigest.com/photos/5e8646644395cf0008add3d5/master/pass/GettyImages-678817847.jpg',
      'https://www.canopyhealth.com/content/canopy-health/en/members/articles/five-nutritious-ways-to-preserve-summer-vegetables-and-fruits.thumb.1280.1280.png'
    ];
    _currentIndex = initialPage;
  }
  final CarouselController _carouselController = new CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        builder: (context, AsyncSnapshot<String> snapshot) {
          // if (snapshot.hasData) {
          return Column(
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  aspectRatio: 2.5,
                  viewportFraction: 0.95,
                  enableInfiniteScroll: false,
                  initialPage: initialPage,
                  autoPlay: false,
                  onPageChanged: (index,reason){
                    setState(() {
                      _currentIndex = index;
                    });
                  }
                ),
                items: imageLinks
                    .map((imageLink) => imageHolder(imageLink))
                    .toList(),
              ),
              customIndicator(),
            ],
          );
          // } else {
          //   return Container();
          // }
        },
      ),
    );
  }

  Widget imageHolder(String imageUrl){
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.rectangle,
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
            width: 1000,
          )),
    );
  }

  Widget customIndicator(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imageLinks.asMap().entries.map((element) => GestureDetector(
        onTap: () => _carouselController.animateToPage(element.key),
        child: Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(element.key == _currentIndex?0.9:0.2)
          ),
        ),
      )).toList(),
    );
  }
}
