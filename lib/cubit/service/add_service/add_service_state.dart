part of 'add_service_cubit.dart';

@immutable
abstract class AddServiceState extends Equatable{}

class AddServiceInitial extends AddServiceState {
  @override
  List<Object?> get props => [];
}

class AddServiceLoading extends AddServiceState {
  bool isLoading;
  AddServiceLoading({this.isLoading = true});
  @override
  List<Object?> get props => [isLoading];
}

class AddServiceLoaded extends AddServiceState {
AddServiceDataModel addServiceDataModel;
AddServiceLoaded({required this.addServiceDataModel});
  @override
  List<Object?> get props => [addServiceDataModel];
}