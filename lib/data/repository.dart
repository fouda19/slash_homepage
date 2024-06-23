
import 'dart:convert';

import 'package:slash_homepage/data/data_provider.dart';
import 'package:slash_homepage/models/item_model.dart';

class Repository {
   final DataProvider dataProvider;

  Repository({required this.dataProvider});

  Future<List<ItemModel>> fetchBestSelling() async {
    String jsonString = await dataProvider.fetchData();
    final jsonResponse = jsonDecode(jsonString);
    var jsonData = jsonResponse['bestSelling'];
    List<ItemModel> list = [];
    for (var i in jsonData) {
      ItemModel item = ItemModel.fromJson(i);
      list.add(item);
    }

    return list;
  }
  Future<List<ItemModel>> fetchRecommended() async {
    String jsonString = await dataProvider.fetchData();
    final jsonResponse = jsonDecode(jsonString);
    var jsonData = jsonResponse['recommendedForYou'];
    List<ItemModel> list = [];
    for (var i in jsonData) {
      ItemModel item = ItemModel.fromJson(i);
      list.add(item);
    }

    return list;
  }
   Future<List<ItemModel>> fetchNewArrival() async {
    String jsonString = await dataProvider.fetchData();
    final jsonResponse = jsonDecode(jsonString);
    var jsonData = jsonResponse['newArrival'];
    List<ItemModel> list = [];
    for (var i in jsonData) {
      ItemModel item = ItemModel.fromJson(i);
      list.add(item);
    }

    return list;
  }
}