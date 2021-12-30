import 'package:ecommerce/src/bloc/app_bloc.dart';
import 'package:ecommerce/src/bloc/app_bloc_provider.dart';
import 'package:flutter/material.dart';

class Dashoard extends StatelessWidget {
  const Dashoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBloc _bloc = AppBlocProvider.of(context);

    void updateAge(int prevAge, int factor) {
      _bloc.updateAge(prevAge + factor);
    }

    @override
    void dispose() {
      _bloc.dispose();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard Screen"),
          backgroundColor: Color(0xff000000),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: _bloc.ageStream,
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            return Column(
              children: <Widget>[
                //Name
                Row(children: <Widget>[
                  Text("Name: ".toUpperCase(),
                      textScaleFactor: 3,
                      style: TextStyle(
                          color: Color(0xffff0000),
                          fontWeight: FontWeight.bold)),
                  Text("John".toUpperCase(),
                      textScaleFactor: 3,
                      style: TextStyle(
                          color: Color(0xff0000ff),
                          fontWeight: FontWeight.bold))
                ], mainAxisAlignment: MainAxisAlignment.center),

                //Age
                Row(children: <Widget>[
                  Text("Age: ".toUpperCase(),
                      textScaleFactor: 3,
                      style: TextStyle(
                          color: Color(0xffff0000),
                          fontWeight: FontWeight.bold)),
                  Text(snapshot.data.toString(),
                      textScaleFactor: 3,
                      style: TextStyle(
                          color: Color(0xff0000ff),
                          fontWeight: FontWeight.bold))
                ], mainAxisAlignment: MainAxisAlignment.center),

                //Age Buttons
                Row(children: <Widget>[
                  Align(
                    child: FloatingActionButton(
                        onPressed: () {
                          updateAge(snapshot.data, -1);
                        },
                        child: Text("-",
                            style: TextStyle(
                                fontSize: 50, color: Color(0xff000000))),
                        backgroundColor: Color.fromARGB(255, 255, 255, 0),
                        heroTag: "plusBtn"),
                    alignment: Alignment.centerLeft,
                    widthFactor: 2.5,
                    heightFactor: 5,
                  ),
                  Align(
                    child: FloatingActionButton(
                        onPressed: () {
                          updateAge(snapshot.data, 1);
                        },
                        child: Text("+",
                            style: TextStyle(
                                fontSize: 50, color: Color(0xff000000))),
                        backgroundColor: Color.fromARGB(255, 0, 255, 0),
                        heroTag: "minusBtn"),
                    alignment: Alignment.centerRight,
                    widthFactor: 2.5,
                    heightFactor: 5,
                  )
                ], mainAxisAlignment: MainAxisAlignment.center),

                //Next Page Button
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "PREV SCREEN",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  color: Color(0xff00ffff),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            );
          },
        ));
  }
}
