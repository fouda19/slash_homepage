import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:slash_homepage/UI/widgets/Listing_best.dart';


class BestSelling extends StatefulWidget {

  const BestSelling({super.key});

  @override
  State<BestSelling> createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Best Selling',
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
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () => {
                        //go to all Best selling page
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12,
                        ),
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
      ListingBest(),
      ],
    );
  }
}
