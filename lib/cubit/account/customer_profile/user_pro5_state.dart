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

class UserPro5Error extends UserPro5State {
  @override
  List<Object?> get props => [];
}

///update user pro5
class UserPro5Updating extends UserPro5State {
  bool isLoading;
  UserPro5Updating({this.isLoading = true});
  @override
  List<Object?> get props => [isLoading];
}

class UserPro5Updated extends UserPro5State {
  @override
  List<Object?> get props => [];
}


class UserPro5UpdateError  extends UserPro5State {
  ErrorAccountModel errorAccountModel;
  UserPro5UpdateError({required this.errorAccountModel});
  @override
  List<Object?> get props => [errorAccountModel];
}

/// update avatar

class UserUpdatedAvatar extends UserPro5State {
  @override
  List<Object?> get props => [];
}

class UserUpdatingAvatar extends UserPro5State {
  bool isLoading;
  UserUpdatingAvatar({this.isLoading = true});
  @override
  List<Object?> get props => [isLoading];
}

/// dele account

class UserPro5Deleting extends UserPro5State {
  bool isLoading;
  UserPro5Deleting({this.isLoading = true});
  @override
  List<Object?> get props => [isLoading];
}

class UserPro5Deleted extends UserPro5State {
  @override
  List<Object?> get props => [];
}



