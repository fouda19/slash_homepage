import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:slash_homepage/UI/widgets/Listing_recommended.dart';

class Recommended extends StatefulWidget {
  

  const Recommended ({super.key});

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override

  Widget build(BuildContext context) {

    return   Column(
      children: [ 
      Container(
  width: MediaQuery.of(context).size.width,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Recommended for you',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
           const Text(
              'See all',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 5,),
             InkWell(
              onTap: () => {//go to all new arrival page
              },
               child: Container(
                width: MediaQuery.of(context).size.width*0.05,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(Icons.arrow_forward_ios_rounded,size: 12,),
                           
                           ),
             ),
          ],
        ),
      ),
      
    ],
  ),
),
const SizedBox(
  height: 12,
),
      
ListingRecommended(),
      ],
    );
}
}
