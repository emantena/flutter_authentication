part of 'user_bloc.dart';

enum RequestStatus {
  initial,
  loading,
  success,
  failure,
}

class UserState extends Equatable {
  final RequestStatus requestStatus;
  final String message;
  final UserModel? user;

  const UserState({
    this.requestStatus = RequestStatus.initial,
    this.message = '',
    this.user,
  });

  UserState copyWith({
    RequestStatus? requestStatus,
    String? message,
    UserModel? user,
  }) {
    return UserState(
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
