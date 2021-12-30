import 'package:flutter/material.dart';
import 'app_bloc.dart';
export 'app_bloc.dart';

// InheritedWidget objects have the ability to be
// searched for anywhere 'below' them in the widget tree.
class AppBlocProvider extends InheritedWidget {
  final AppBloc bloc;

  AppBlocProvider({Key? key, required Widget child})
      : bloc = AppBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(AppBlocProvider old) => true;

  // this method is used to access an instance of
  // an inherited widget from lower in the tree.
  // `BuildContext.dependOnInheritedWidgetOfExactType` is a built in
  // Flutter method that does the hard work of traversing the tree for you

  static AppBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppBlocProvider>()!.bloc;
  }

  // static AppBlocProvider? of(BuildContext context) {
  //   return context.dependOnInheritedWidgetOfExactType<AppBlocProvider>();
  // }
}
