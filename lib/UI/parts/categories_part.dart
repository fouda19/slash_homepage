import 'package:flutter/material.dart';
import 'package:slash_homepage/models/categories_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slash_homepage/UI/widgets/categories_tile.dart';
class Categories extends StatefulWidget {

  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
List<Category> categories = [
  Category(title: 'Fashion', icon: FontAwesomeIcons.tshirt),
  Category(title: 'Games', icon:FontAwesomeIcons.diceSix),
  Category(title: 'Accessories', icon: FontAwesomeIcons.eyeDropper),
    Category(title: 'Books', icon:FontAwesomeIcons.bookOpen),
  Category(title: 'Articles', icon: FontAwesomeIcons.newspaper),
  
  ];

  @override

  Widget build(BuildContext context) {
    return  Column(
      children: [ 
      Container(
  width: MediaQuery.of(context).size.width,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Categories',
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
          const  SizedBox(width: 5,),
             InkWell(
              onTap: () => {//go to all categories page
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
      
        Container(  
          width: MediaQuery.of(context).size.width,
          height: 75,
          child: 
        ListView.builder (
          itemCount: categories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          
          itemBuilder: (context, index) {
              double itemWidth;
      // if(width<600)
      {

      
      double baseItemWidth = 55; 
      
      
      double itemsOnScreen = (MediaQuery.of(context).size.width / baseItemWidth);
      
      
       itemWidth = MediaQuery.of(context).size.width / itemsOnScreen;
      }


            return SizedBox( 
              width: itemWidth,
              child: 
                
            Align(
              alignment: Alignment.topLeft,
              child: CategoriesTile(
                icon: categories[index].icon,
                title: categories[index].title,
              ),
            ),
            );
          },
        ),
        ),

      ],
    );
}
}
