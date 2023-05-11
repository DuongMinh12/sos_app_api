part of 'register_cubit.dart';

@immutable
abstract class RegisterState extends Equatable {}

class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterState {
  bool isLoading;
  RegisterLoading({this.isLoading = true});
  @override
  List<Object?> get props => [isLoading];
}

class RegisterLoaded extends RegisterState {
  RegisterDataModel registerDataModel;
  // ErrorAccountModel? errorAccountModel;
  RegisterLoaded({required this.registerDataModel,});
  @override
  List<Object?> get props => [];
}

// class RegisterError extends RegisterState {
//   ErrorAccountModel errorAccountModel;
//   RegisterError({required this.errorAccountModel});
//   @override
//   List<Object?> get props => [];
// }
