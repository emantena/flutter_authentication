import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_autentication/presentation/user_registration/domain/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginBloc() : super(const LoginState()) {
    on<LoginUserEvent>(_registerUser);
  }

  FutureOr<void> _registerUser(
      LoginUserEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(requestStatus: RequestStatus.loading));

    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      final userModel = UserModel(
        email: event.email,
        password: event.password,
      );

      emit(
        state.copyWith(
          requestStatus: RequestStatus.success,
          user: userModel,
        ),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          requestStatus: RequestStatus.failure,
          message: e.toString(),
        ),
      );
    }
  }
}
