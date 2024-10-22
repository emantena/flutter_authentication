import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String email;
  final String password;

  const UserModel({this.email = '', this.password = ''});

  @override
  List<Object?> get props => [email, password];
}
