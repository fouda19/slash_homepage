import 'package:bloc/bloc.dart';
import 'package:slash_homepage/data/repository.dart';
import 'package:slash_homepage/models/item_model.dart';

abstract class DataEvent {}

class LoadBestEvent extends DataEvent {}
class LoadRecommendedEvent extends DataEvent {}


abstract class DataState {}

class DataInitialState extends DataState {}

class BestDataLoadingState extends DataState {}
class RecommendedDataLoadingState extends DataState {}

class BestDataLoadedState extends DataState {
  final List<ItemModel> data;
  BestDataLoadedState({required this.data});
}
class RecommendedDataLoadedState extends DataState {
  final List<ItemModel> data;
  RecommendedDataLoadedState({required this.data});
}

class NewDataLoadedState extends DataState {
  final List<ItemModel> data;
  NewDataLoadedState({required this.data});
}


class DataErrorState extends DataState {
  final String error;
  DataErrorState({required this.error});
}


class DataBloc extends Bloc<DataEvent, DataState> {
  final Repository repository;

  DataBloc(this.repository) : super(DataInitialState()) {
    on<LoadBestEvent>((event, emit) async {
      emit(BestDataLoadingState()); 
      
  
      try {
        List<ItemModel> list = await repository.fetchBestSelling();


        emit(BestDataLoadedState(data: list));
      } catch (e) {
        emit(DataErrorState(error: 'Failed to load data'));
      }
    });


  
  }
}