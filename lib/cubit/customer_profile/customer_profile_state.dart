part of 'customer_profile_cubit.dart';

@immutable
abstract class CustomerProfileState extends Equatable {
  const CustomerProfileState();
}

class CustomerProfileLoading extends CustomerProfileState {
  final bool isdLoading;
  CustomerProfileLoading({this.isdLoading = false});
  @override
  List<Object?> get props => [isdLoading];
}

class CustomerProfileLoaded extends CustomerProfileState {
  List<Customer> user;
  CustomerProfileLoaded({this.user = const <Customer>[]});
  @override
  List<Object?> get props => [user];
}

class CustomerProfileError extends CustomerProfileState {
  @override
  List<Object?> get props => [];
}
