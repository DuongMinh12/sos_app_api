part of 'close_system_cubit.dart';

@immutable
abstract class CloseSystemState extends Equatable{
  const CloseSystemState();
}

class CloseSystemInitial extends CloseSystemState {
const CloseSystemInitial();

  @override
  List<Object?> get props => [];
}

class CloseSystemChanged extends CloseSystemState {
  final ChangeStateModel changeStateModel;
  const CloseSystemChanged (this.changeStateModel);
  @override
  List<Object?> get props => [changeStateModel];
}
