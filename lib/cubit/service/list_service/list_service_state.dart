part of 'list_service_cubit.dart';

@immutable
abstract class ListServiceState extends Equatable {}

class ListServiceInitial extends ListServiceState {
  @override
  List<Object?> get props => [];
}
class ListServiceLoading extends ListServiceState {
  bool isLoading;
  ListServiceLoading({this.isLoading = true});
  @override
  List<Object?> get props => [isLoading];
}
class ListServiceLoaded extends ListServiceState {
  List<ListServiceModel> listService;
  ListServiceLoaded({required this.listService});
  @override
  List<Object?> get props => [listService];
}

///Change state

// class StateServiceLoading extends ListServiceState {
//   bool isLoading;
//   StateServiceLoading({this.isLoading = true});
//   @override
//   List<Object?> get props => [isLoading];
// }
//
// class StateServiceLoaded extends ListServiceState {
//   StateServiceModel listState;
//   StateServiceLoaded({required this.listState});
//   @override
//   List<Object?> get props => [listState];
// }
