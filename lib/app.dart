import 'package:ecommerce/src/bloc/app_bloc_provider.dart';
import 'package:ecommerce/src/ui/home_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
        child: MaterialApp(
      title: "Ecommerce",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
          // Define the default brightness and colors.
          splashColor: Color.fromRGBO(255, 255, 255, 1),
          primaryColor: Color.fromRGBO(0, 0, 0, 1),
          brightness: Brightness.dark,

          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'))),
      home: HomeScreen(),
    ));
  }
}
