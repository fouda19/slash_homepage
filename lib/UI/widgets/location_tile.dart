import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _MyLocationState();
}

class _MyLocationState extends State<Location> {
  var place = 'Nasr city';
  var city='Cairo';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
        const  Icon(
            Icons.location_on,
            color: Colors.black,
            size: 18,
          ),
        const  SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place,
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: 11),
              ),
              
              Text(
                city,
                style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 11),
              ),
            ],
          ),
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.black,
                size: 18,
              )),
        ],
      ),
    );
  }
}
