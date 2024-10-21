import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserBloc() : super(UserInitial());

  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is RegisterUserEvent) {
      yield UserLoading();
      try {
        await _auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        yield UserSuccess();
      } catch (e) {
        yield UserFailure(e.toString());
      }
    }
  }
}
