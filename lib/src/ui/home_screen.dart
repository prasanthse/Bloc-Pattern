import 'package:ecommerce/src/bloc/app_bloc.dart';
import 'package:ecommerce/src/bloc/app_bloc_provider.dart';
import 'package:ecommerce/src/ui/dashboard_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // AppBloc _bloc = AppBlocProvider.of(context)!.bloc;
    AppBloc _bloc = AppBlocProvider.of(context);

    void updateAge(int prevAge, int factor) {
      _bloc.updateAge(prevAge + factor);
    }

    void increaseSalary() {
      _bloc.updateSalary.add(10000);
    }

    @override
    void dispose() {
      super.dispose();
      _bloc.dispose();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          backgroundColor: Color(0xffff0000),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: _bloc.ageStream,
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            return StreamBuilder(
                stream: _bloc.salaryStream,
                builder: (context, AsyncSnapshot<dynamic> snapshot2) {
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

                      //Salary
                      Row(children: <Widget>[
                        Text("Salary: ".toUpperCase(),
                            textScaleFactor: 3,
                            style: TextStyle(
                                color: Color(0xffff0000),
                                fontWeight: FontWeight.bold)),
                        Text(snapshot2.data.toString(),
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

                      //Salary Button
                      FlatButton(
                        onPressed: () {
                          increaseSalary();
                        },
                        child: Text(
                          "Increase Salary",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        color: Color(0xffff00ff),
                      ),

                      //Next Page Button
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashoard()),
                          );
                        },
                        child: Text(
                          "NEXT SCREEN",
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
                });
          },
        ));
  }
}
