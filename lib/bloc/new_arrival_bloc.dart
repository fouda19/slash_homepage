import 'package:bloc/bloc.dart';
import 'package:slash_homepage/UI/parts/recommended.dart';
import 'package:slash_homepage/data/repository.dart';
import 'package:slash_homepage/models/item_model.dart';

abstract class NewArrivalEvent {}

class LoadNewEvent extends NewArrivalEvent {}


abstract class DataState {}

class DataInitialState extends DataState {}


class NewDataLoadingState extends DataState {}


class NewDataLoadedState extends DataState {
  final List<ItemModel> data;
  NewDataLoadedState({required this.data});
}


class DataErrorState extends DataState {
  final String error;
  DataErrorState({required this.error});
}


class NewArrivalBloc extends Bloc<NewArrivalEvent, DataState> {
  final Repository repository;

  NewArrivalBloc(this.repository) : super(DataInitialState()) {


     on<LoadNewEvent>((event, emit) async {
      emit(NewDataLoadingState()); 
   
      try {
        List<ItemModel> list = await repository.fetchNewArrival();
            
        emit(NewDataLoadedState(data: list));
      } catch (e) {
        emit(DataErrorState(error: 'Failed to load data'));
      }
    });
  }
}