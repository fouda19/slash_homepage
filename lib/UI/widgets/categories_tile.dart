import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class CategoriesTile extends StatefulWidget {
  final IconData icon;
  final String title;
  const CategoriesTile({super.key, required this.icon, required this.title});

  @override
  State<CategoriesTile> createState() => _CategoriesTileState();
}

class _CategoriesTileState extends State<CategoriesTile> {
  @override

  Widget build(BuildContext context) {

    return  LayoutBuilder(
      builder: (context, constraints) {
        
      
      return SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
      
        child: Column(
          children: [ CircleAvatar(
            radius: 22,
            backgroundColor: Color.fromARGB(255, 39, 38, 38),
            child: Icon(widget.icon ,color: Colors.white, size: 18,),
          ),
            SizedBox(height: 3,),
            Text(widget.title
              ,style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w400
              ),)
        
          
        
          ],
        ),
      );
      }
    );
}
}
