import 'package:flutter/material.dart';
import 'package:slash_homepage/UI/widgets/location_tile.dart';
import 'package:slash_homepage/UI/widgets/search_part.dart';
import 'package:flutter/cupertino.dart';
import 'package:slash_homepage/UI/widgets/homepage.dart';
import 'package:slash_homepage/UI/widgets/web_side_bar.dart';
import 'package:slash_homepage/bloc/best_selling_bloc.dart';
typedef void OnClick(int index);


class AppPage extends StatefulWidget {
  const AppPage({super.key, });
   


  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  var indexBar = 0;

OnClick(int index){
  setState(() {
    indexBar=index;
  });
}

  Widget build(BuildContext context) {
  final List<Widget> _tabs = [
     HomePage( ),
    const Text('FAVOURITES'),
    const Text('MY CART'),
    const Text('PROFILE'),
  ];
    var width=MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Location(),
            ],
          ),
          leading: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Slash.',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: Stack(
                children: <Widget>[
                  Icon(Icons.notifications_outlined, color: Colors.black),
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 6,
                        minHeight: 6,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body:(width<600)? _tabs[indexBar]:
        Row(
          children: [
            Expanded( flex: 1,
              child: SideBar(onClick: OnClick,)  ),
            Expanded(
              flex: 4,
              child: _tabs[indexBar]),
          ],
        ),
        bottomNavigationBar:(width<600)? SafeArea(
          child: Container(
            height: 56,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: (indexBar == 0) ? Colors.black : Colors.white,
                      width: 3,
                    ),
                  ),
                ),
                child: SizedBox(
                  child: InkWell(
                    onTap: () => {
                      setState(() {
                        indexBar = 0;
                      })
                    },
                    child: Column(
                      children: [
                        Icon(
                            (indexBar == 0) ? Icons.home : Icons.home_outlined),
                        Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: (indexBar == 0)
                                  ? FontWeight.bold
                                  : FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: (indexBar == 1) ? Colors.black : Colors.white,
                      width: 3,
                    ),
                  ),
                ),
                child: SizedBox(
                  child: InkWell(
                    onTap: () => {
                      setState(() {
                        indexBar = 1;
                      })
                    },
                    child: Column(
                      children: [
                        Icon((indexBar == 1)
                            ? Icons.favorite
                            : Icons.favorite_outline_outlined),
                        Text(
                          'favourites',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: (indexBar == 1)
                                  ? FontWeight.bold
                                  : FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: (indexBar == 2) ? Colors.black : Colors.white,
                      width: 3,
                    ),
                  ),
                ),
                child: SizedBox(
                  child: InkWell(
                    onTap: () => {
                      setState(() {
                        indexBar = 2;
                      })
                    },
                    child: Column(
                      children: [
                        Icon((indexBar == 2)
                            ? Icons.shopping_cart
                            : Icons.shopping_cart_outlined),
                        Text(
                          'My cart',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: (indexBar == 2)
                                  ? FontWeight.bold
                                  : FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: (indexBar == 3) ? Colors.black : Colors.white,
                      width: 3,
                    ),
                  ),
                ),
                child: SizedBox(
                  child: InkWell(
                    onTap: () => {
                      setState(() {
                        indexBar = 3;
                      })
                    },
                    child: Column(
                      children: [
                        Icon((indexBar == 3)
                            ? Icons.person
                            : Icons.person_2_outlined),
                        Text(
                          'profile',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: (indexBar == 3)
                                  ? FontWeight.bold
                                  : FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ):null,
      ),
    );
  }
}
