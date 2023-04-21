import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/customer_model.dart';

part 'customer_profile_state.dart';

class CustomerProfileCubit extends Cubit<CustomerProfileState> {
  CustomerProfileCubit() : super(CustomerProfileLoading());
}
