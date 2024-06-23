
import 'package:flutter/services.dart';

class DataProvider{

  Future<String> fetchData() async {
     String jsonString = await rootBundle.loadString('assets/dummyData.json');
    return jsonString;
  }


}