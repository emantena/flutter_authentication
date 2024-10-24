import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_autentication/presentation/user_registration/domain/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserBloc() : super(const UserState()) {
    on<RegisterUserEvent>(_registerUser);
  }

  FutureOr<void> _registerUser(
      RegisterUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(requestStatus: RequestStatus.loading));

    try {
      final user = await _auth.createUserWithEmailAndPassword(
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
