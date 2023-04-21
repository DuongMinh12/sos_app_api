import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:warning_app/models/change_state_model.dart';

part 'close_system_state.dart';

class CloseSystemCubit extends Cubit<CloseSystemState> {
  CloseSystemCubit() : super(CloseSystemInitial());
}
