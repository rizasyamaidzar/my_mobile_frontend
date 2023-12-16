import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_mobile_frontend/data/bloc/post_bloc.dart';
import 'package:my_mobile_frontend/data/repository/api_repository.dart';
import 'package:my_mobile_frontend/presentation/screen/HomeScreen.dart';
import 'package:my_mobile_frontend/service/data_repository.dart';
void main() {
  runApp(MyApp(
    dataService: DataService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.dataService}) : super(key: key);
  final DataService dataService;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Api',
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) =>
            PostBloc(apiRepository: ApiRepository(dataService: dataService))
              ..add(LoadEvent()),
        child: const HomeScreen(),
        )
    );
  }
}