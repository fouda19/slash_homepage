import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

class Item extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  final double price;
  const Item(
      {super.key,
      required this.id,
      required this.title,
      required this.image,
      required this.price});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  var favourite=false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth*0.98 ,
        height: constraints.maxHeight ,
        child: Column(
          children: [
            Stack(children: [
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.6,
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                
                  borderRadius: BorderRadius.circular(6),
                ),
      child: ClipRRect(
      borderRadius: BorderRadius.circular(6), // Match the container's borderRadius
      child: Image.asset(
        widget.image,
        fit: BoxFit.fill,
      ),
    ),
              ),
              Positioned(
                right: 7,
                top: 5,
                child: InkWell(
                  onTap: () => {
                    setState(() {
                      favourite=!favourite;
                    }),
                  },
                  child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:(!favourite)? Icon(
                         Icons.favorite_border,
                        size: 12,
                      ):Icon(Icons.favorite,color: Colors.red,size: 12,)),
                ),
              ),
            ]),
            SizedBox(
              height: 3,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 2),
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EGP ${widget.price}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 39, 38, 38),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.favorite,
                              size: 10,
                              color: const Color.fromARGB(255, 255, 0, 0),
                            ),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          InkWell(
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 39, 38, 38),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
      }
    );
  }
}
