import 'package:flutter_autentication/presentation/login/controllers/login_bloc/login_bloc.dart';
import 'package:flutter_autentication/presentation/user_registration/controllers/user_bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerFactory(() => UserBloc());
    sl.registerFactory(() => LoginBloc());
  }
}
