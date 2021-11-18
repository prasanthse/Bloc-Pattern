import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final int _loadingTime = 5;
  final String logoPah = "assets/images/logo.png";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loader(),
        builder: (contetx, AsyncSnapshot<void> snapshot) {
          return Container(
            color: Theme.of(context).splashColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  logoPah,
                  width: 100,
                  height: 100,
                )
              ],
            ),
          );
        });
  }

  Future<void> _loader() async {
    Future.delayed(Duration(seconds: _loadingTime), () {
      debugPrint("over");
    });
  }
}
