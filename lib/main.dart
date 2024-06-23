import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_homepage/bloc/best_selling_bloc.dart';
import 'package:slash_homepage/bloc/new_arrival_bloc.dart';
import 'package:slash_homepage/bloc/recommended_bloc.dart';
import 'package:slash_homepage/data/data_provider.dart';
import 'package:slash_homepage/data/repository.dart';
import 'UI/screens/apppage.dart';

void main() {
    final dataProvider = DataProvider(); 
  final repository = Repository(dataProvider: dataProvider);
  final dataBloc = DataBloc(repository);
  final recommendedBloc = RecommendedBloc(repository);
  final newArrivalBloc = NewArrivalBloc(repository);
  runApp( MyApp(dataBloc: dataBloc, recommendedBloc: recommendedBloc, newArrivalBloc: newArrivalBloc));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.dataBloc, required this.recommendedBloc, required this.newArrivalBloc});
  
  final DataBloc dataBloc;
  final RecommendedBloc recommendedBloc;
  final NewArrivalBloc newArrivalBloc;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        
      ),
      home:  MultiBlocProvider(
        providers: [
          BlocProvider<DataBloc>(
            create: (context) => dataBloc,
          ),
          BlocProvider<RecommendedBloc>(
            create: (context) => recommendedBloc,
          ),
          BlocProvider<NewArrivalBloc>(
            create: (context) => newArrivalBloc,
          ),
        ],
        child: AppPage(),
      ),
    );
  }
}

