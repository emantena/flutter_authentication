part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class RegisterUserEvent extends UserEvent {
  final String email;
  final String password;

  @override
  const RegisterUserEvent(this.email, this.password);

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
