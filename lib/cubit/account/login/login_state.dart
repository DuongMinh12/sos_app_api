part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  bool isLoading;
  LoginLoading({this.isLoading = true});
  @override
  List<Object?> get props => [isLoading];
}

class LoginLoaded extends LoginState {
  LoginApiModel listlogin;
  LoginLoaded({required this.listlogin});
  @override
  List<Object?> get props => [listlogin];
}
