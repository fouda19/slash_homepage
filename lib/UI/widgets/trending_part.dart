import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Trends extends StatefulWidget {
  const Trends({super.key});

  @override
  State<Trends> createState() => _MyTrendsState();
}

class _MyTrendsState extends State<Trends> {
  
  List<String> images = [
    'assets/images/trend_poster_1.png',
    'assets/images/trend_poster_2.png',
  
  ];
  var currentIndex=0;
  @override
  Widget build(BuildContext context) {
 var width=MediaQuery.of(context).size.width;
  var height=MediaQuery.of(context).size.height;
    return Column( children:[ CarouselSlider(
  options: CarouselOptions(height: height*0.15, autoPlay: true ,enableInfiniteScroll: false,enlargeCenterPage: true, onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },enlargeFactor: 0.3),
  items: images.map((image) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: width,
          
      
          margin:const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(7),
          ),
          child:  ClipRRect(
      borderRadius: BorderRadius.circular(6), 
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    ),
        );
      },
    );
  }).toList(),
),
          cursorIndicator(),
]);
    
  }
   cursorIndicator(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: images.map((url) {
        int index = images.indexOf(url);
        return Container(
          width:   currentIndex == index?12: 6,
          height:  6,
          margin:const EdgeInsets.symmetric(vertical: 10.0, horizontal: 1),
          decoration: BoxDecoration(
            shape:BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5),
            color: currentIndex == index
                ? const Color.fromARGB(255, 0, 0, 0)
                : Colors.grey,
          ),
        );
      }).toList(),
    );
   }
}
