import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _MyLocationState();
}

class _MyLocationState extends State<Location> {
  @override
  var place = 'Nasr city';
  var city='Cairo';
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: Colors.black,
            size: 18,
          ),
          SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place,
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: 11),
              ),
              
              Text(
                city,
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 11),
              ),
            ],
          ),
          IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.black,
                size: 18,
              )),
        ],
      ),
    );
  }
}
