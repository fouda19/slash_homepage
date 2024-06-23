import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _MySearchState();
}

class _MySearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        
 var width=constraints.maxWidth;
    

      return SizedBox(
        child: Row(
          children: [
            
            InkWell(onTap: ()=>{
              //go to search page
            },
              child: 
            Container(
              width: width*0.78,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                        SizedBox(width: 5,),
                  Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 18,
                  ),
                  SizedBox(width: 5,),
                  Text(
                    'Search here..',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: 11),
                  ),
                ],
              ),
            ),),
            SizedBox(width: width*0.025,),
            Container(
              width: width*0.1,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(Icons.sort),
            
            ),
          ],
        ),
      );
      }
    );
    
  }
}
