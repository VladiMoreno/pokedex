import 'package:get_it/get_it.dart';

class AppStates {
  final GetIt locator = GetIt.instance;
  static final AppStates _instance = AppStates._internal();

  factory AppStates() {
    return _instance;
  }

  AppStates._internal();

  init() {
    //locator.registerSingleton<ClassState>(ClassState());
  }

  reset() {
    //variableState.reset();
  }

  //ClassState get variableState => locator<ClassState>();
}
