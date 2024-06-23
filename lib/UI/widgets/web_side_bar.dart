//i want a sidebar here 

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:slash_homepage/UI/screens/apppage.dart';
class SideBar extends StatefulWidget {
  final OnClick? onClick;
  const SideBar({super.key, this.onClick});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  var currentIndex=0;
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        
      var width=constraints.maxWidth;
      return Container(
        color: Colors.grey[200],
        child: SizedBox(
          
          child: ListView(
            children: [
              Container(
                 width: width ,
                 height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: (currentIndex == 0) ? Colors.black:Colors.grey[200]!,
                        width: 3,
                      ),
                    ),
                  ),
                child: ListTile(
                  title:    Text(
                              'Home',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: (currentIndex == 0)
                                      ? FontWeight.bold
                                      : FontWeight.w400),
                            ),
                  leading:  Icon(
                                (currentIndex == 0) ? Icons.home : Icons.home_outlined),
                  onTap: (){
                    setState(() {
                      currentIndex=0;
                      widget.onClick!(currentIndex);
                    });
                  },
                ),
              ),
                      Container(
                         width: width ,
                 height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: (currentIndex == 1) ? Colors.black :Colors.grey[200]!,
                        width: 3,
                      ),
                    ),
                  ),
                        child: ListTile(
                                      title:  Text(
                              'favourites',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: (currentIndex == 1)
                                      ? FontWeight.bold
                                      : FontWeight.w400),
                            ),
                                      leading:  Icon((currentIndex == 1)
                                ? Icons.favorite
                                : Icons.favorite_outline_outlined),
                                      onTap: (){
                                        setState(() {
                                          currentIndex=1;
                                                                widget.onClick!(currentIndex);

                                        });
                                      },
                                    ),
                      ),
               Container(
                 width: width ,
                 height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: (currentIndex == 2) ? Colors.black : Colors.grey[200]!,
                        width: 3,
                      ),
                    ),
                  ),
                 child: ListTile(
                  title:   Text(
                              'My cart',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: (currentIndex == 2)
                                      ? FontWeight.bold
                                      : FontWeight.w400),
                            ),
                  leading:  Icon((currentIndex == 2)
                                ? Icons.shopping_cart
                                : Icons.shopping_cart_outlined),
                  onTap: (){
                    setState(() {
                      currentIndex=2;
                                            widget.onClick!(currentIndex);

                    });
                  },
                             ),
               ),
        
        
              Container(
                 width: width ,
                 height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: (currentIndex == 3) ? Colors.black :Colors.grey[200]!,
                        width: 3,
                      ),
                    ),
                  ),
                child: ListTile(
                  title:    Text(
                              'profile',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: (currentIndex == 3)
                                      ? FontWeight.bold
                                      : FontWeight.w400),
                            ),
                  leading:   Icon((currentIndex == 3)
                                ? Icons.person
                                : Icons.person_2_outlined),
                  onTap: (){
                    setState(() {
                      currentIndex=3;
                                            widget.onClick!(currentIndex);

                    });
                  },
                ),
              ),
             
            
        
              
             
             ],
          ),  
        ),
      );
      }
    );
    

  }

   
}
