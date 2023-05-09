part of 'user_pro5_cubit.dart';

@immutable
abstract class UserPro5State extends Equatable {}

class UserPro5Initial extends UserPro5State {
  @override
  List<Object?> get props => [];
}

class UserPro5Loading extends UserPro5State {
  bool isLoading;
  UserPro5Loading({this.isLoading = true});
  @override
  List<Object?> get props => [isLoading];
}

class UserPro5Loaded extends UserPro5State {
  User user;
  UserPro5Loaded({required this.user});
  @override
  List<Object?> get props => [user];
}
