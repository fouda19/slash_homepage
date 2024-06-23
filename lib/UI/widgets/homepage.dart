import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slash_homepage/UI/parts/best_selling.dart';
import 'package:slash_homepage/UI/parts/new_arrival.dart';
import 'package:slash_homepage/UI/parts/recommended.dart';
import 'package:slash_homepage/UI/widgets/location_tile.dart';
import 'package:slash_homepage/UI/widgets/search_part.dart';
import 'package:flutter/cupertino.dart';
import 'package:slash_homepage/UI/widgets/trending_part.dart';
import 'package:slash_homepage/UI/widgets/categories_tile.dart';
import 'package:slash_homepage/UI/parts/categories_part.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
    


  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
 
  Widget build(BuildContext context) {
    return  Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          children: <Widget>[
           Padding( padding: EdgeInsets.only(left: 10),
              child: Search()),
            SizedBox(height: 10,),
            Trends(),
                        SizedBox(height: 4,),
            Padding( padding: EdgeInsets.only(left: 10),
              child: Categories()),
                                    
            Padding( padding: EdgeInsets.only(left: 10),
              child: BestSelling()),
   Padding( padding: EdgeInsets.only(left: 10),
              child: NewArrival( )),
                 Padding( padding: EdgeInsets.only(left: 10),
              child: Recommended()),
          
          
          ],
        ),
      ),
    );
  }
}
