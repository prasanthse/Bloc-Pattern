//Step 01: Import
import 'dart:async';
import 'package:rxdart/rxdart.dart'; //flutter pub add rxdart (Only for Method 01)

class AppBloc {
  //================================== METHOD 01 ======================================
  //Step 01: Import
  //Step 02: Define your variable as BehaviorSubject
  //Step 03: Create Constructor; Define Data
  //Step 04: Stream Sink Getters
  //Step 05: Core Functions
  //Step 06: Dispose

  AppBloc() {
    //Step 03 in Method 01: Create Constructor; Define Data
    _age.sink.add(25);

    //Step 06 in Method 02: Create Constructor; Add Data; Listen to changes
    _salaryStreamController.add(_salary);
    _updateSalaryStreamController.stream.listen(_updateSalary);
  }

  void dispose() {
    //Step 06 in Method 01: Dispose
    _age.close();

    //Step 07 in Method 02: Dispose
    _salaryStreamController.close();
    _updateSalaryStreamController.close();
  }

  //Step 02: Define your variable as BehaviorSubject
  final BehaviorSubject<int> _age = BehaviorSubject<int>();

  //Step 04: Stream Sink Getters
  Stream<int> get ageStream => _age.stream;

  //Step 05: Core Functions
  void _updateAge(int newAge) {
    _age.sink.add(newAge);
  }

  Function(int age) get updateAge => _updateAge;

  //================================== METHOD 02 ======================================
  //Step 01: Import
  //Step 02: Define your variable
  //Step 03: Create Stream Controller
  //Step 04: Stream & Sink Getters
  //Step 05: Core Functions
  //Step 06: Create Constructor; Add Data; Listen to changes
  //Step 07: Dispose

  //Step 02: Define your variable
  int _salary = 10000;
  int name = 10;

  //Step 03: Create Stream Controller
  final _salaryStreamController = StreamController<int>.broadcast();
  final _updateSalaryStreamController = StreamController<int>();

  //Step 04: Stream & Sink Getters
  Stream get salaryStream => _salaryStreamController.stream.asBroadcastStream();
  StreamSink get updateSalary => _updateSalaryStreamController.sink;

  //Step 05: Core Functions
  void _updateSalary(int value) {
    _salary += value;
    _salaryStreamController.add(_salary);
  }
}
