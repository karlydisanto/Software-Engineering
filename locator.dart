
import 'package:fit4u/services/auth.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

// define object and services at global level
setupLocator(){
  locator.registerSingleton<AuthService>(AuthService());
}
