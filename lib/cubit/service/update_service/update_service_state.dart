part of 'update_service_cubit.dart';

@immutable
abstract class UpdateServiceState extends Equatable {}

class UpdateServiceInitial extends UpdateServiceState {
  @override
  List<Object?> get props => [];
}

class UpdateServiceLoading extends UpdateServiceState {
  bool isLoading;
  UpdateServiceLoading({this.isLoading = true});
  @override
  List<Object?> get props => [isLoading];
}

class UpdateServiceLoaded extends UpdateServiceState {
  @override
  List<Object?> get props => [];
}
