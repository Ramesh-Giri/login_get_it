import 'package:flutter_authentication/services/auth_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setLocator(){

    locator.registerLazySingleton<IAuthService>(() => AuthService());

}
