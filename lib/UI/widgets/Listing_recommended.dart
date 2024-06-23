import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_homepage/bloc/recommended_bloc.dart';
import 'package:slash_homepage/UI/widgets/item.dart';

class ListingRecommended extends StatefulWidget {
 


  const ListingRecommended({super.key});

  @override
  State<ListingRecommended> createState() => _ListingRecommendedState();
}

class _ListingRecommendedState extends State<ListingRecommended> {


  @override
  void initState() {
    super.initState();
        final dataBloc = BlocProvider.of<RecommendedBloc>(context);
  
      dataBloc.add(LoadRecommendedEvent());
  }

  @override
  Widget build(BuildContext context) {

      
    
    return BlocBuilder<RecommendedBloc, DataState>(
      builder: (context, state) {

        if (state is RecommendedDataLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is RecommendedDataLoadedState) {
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
