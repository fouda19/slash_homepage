
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_homepage/bloc/new_arrival_bloc.dart';
import 'package:slash_homepage/UI/widgets/item.dart';

class ListingNewArrival extends StatefulWidget {
 


  const ListingNewArrival({super.key});

  @override
  State<ListingNewArrival> createState() => _ListingNewArrivalState();
}

class _ListingNewArrivalState extends State<ListingNewArrival> {


  @override
  void initState() {
    super.initState();
        final dataBloc = BlocProvider.of<NewArrivalBloc>(context);
  
      dataBloc.add(LoadNewEvent());
  }

  @override
  Widget build(BuildContext context) {

      
    
    return BlocBuilder< NewArrivalBloc, DataState>(
      builder: (context, state) {
        if (state is  NewDataLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is NewDataLoadedState) {
          var list = state.data; //
          var width = MediaQuery.of(context).size.width;
          return Container(
            width: width,
            height: MediaQuery.of(context).size.height * 0.22,
            child: ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                double itemWidth;
                if (width < 600) {
                  double baseItemWidth = 95;
                  double itemsOnScreen = width / baseItemWidth;
                  itemWidth = width / itemsOnScreen;
                } else {
                  itemWidth = width * 0.2;
                }

                return SizedBox(
                  width: itemWidth,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Item(
                      id: list[index].id,
                      image: list[index].image,
                      price: list[index].price,
                      title: list[index].name,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is DataErrorState) {
          return Text('Error: ${state.error}');
        }
        return Container(); // Fallback for unhandled states
      },
    );
  }
}
