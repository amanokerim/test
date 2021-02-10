import 'package:amanokerim/blocs/home_bloc.dart';
import 'package:amanokerim/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 18.0),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => HomeBloc([]),
        child: HomeScreen(),
      ),
    );
  }
}
