part of 'login_bloc.dart';

enum RequestStatus {
  initial,
  loading,
  success,
  failure,
}

class LoginState extends Equatable {
  final RequestStatus requestStatus;
  final String message;
  final UserModel? user;

  const LoginState({
    this.requestStatus = RequestStatus.initial,
    this.message = '',
    this.user,
  });

  LoginState copyWith({
    RequestStatus? requestStatus,
    String? message,
    UserModel? user,
  }) {
    return LoginState(
      requestStatus: requestStatus ?? this.requestStatus,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        requestStatus,
        message,
        user,
      ];
}
