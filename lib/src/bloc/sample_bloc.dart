import 'dart:async';

class SampleBloc {
  int _routerId = 0;

  final _routerIDStreamController = StreamController<int>();
  final _changeRouterIDStreamController = StreamController<int>();

  SampleBloc() {
    _routerIDStreamController.add(_routerId);
    _changeRouterIDStreamController.stream.listen(changeRouterID);
  }

  Stream<int> get routerIDStream => _routerIDStreamController.stream;
  StreamSink<int> get routerIDSink => _routerIDStreamController.sink;
  StreamSink<int> get changeRouterIDSink =>
      _changeRouterIDStreamController.sink;

  changeRouterID(int newRoterID) {
    _routerId = newRoterID;
    _routerIDStreamController.add(_routerId);
  }

  dispose() {
    _routerIDStreamController.close();
    _changeRouterIDStreamController.close();
  }
}
