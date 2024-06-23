import 'package:bloc/bloc.dart';
import 'package:slash_homepage/UI/parts/recommended.dart';
import 'package:slash_homepage/data/repository.dart';
import 'package:slash_homepage/models/item_model.dart';

abstract class RecommendedEvent {}

class LoadRecommendedEvent extends RecommendedEvent {}


abstract class DataState {}

class DataInitialState extends DataState {}


class RecommendedDataLoadingState extends DataState {}


class RecommendedDataLoadedState extends DataState {
  final List<ItemModel> data;
  RecommendedDataLoadedState({required this.data});
}


class DataErrorState extends DataState {
  final String error;
  DataErrorState({required this.error});
}


class RecommendedBloc extends Bloc<RecommendedEvent, DataState> {
  final Repository repository;

  RecommendedBloc(this.repository) : super(DataInitialState()) {


     on<LoadRecommendedEvent>((event, emit) async {
      emit(RecommendedDataLoadingState()); 
   
      try {
        List<ItemModel> list = await repository.fetchRecommended();
       
        emit(RecommendedDataLoadedState(data: list));
      } catch (e) {
        emit(DataErrorState(error: 'Failed to load data'));
      }
    });
  }
}