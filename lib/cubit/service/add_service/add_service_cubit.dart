import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/models/add_service_data_model.dart';
import 'package:warning_app/repositories/add_service_responsitory.dart';

part 'add_service_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  AddServiceCubit() : super(AddServiceInitial());
  AddServiceResponsitory addServiceResponsitory =AddServiceResponsitory();

  Future addServiceIcon(BuildContext context, String nameService, String linkOn, String linkOff, String type, var fileImage) async{
    emit(AddServiceLoading(isLoading: true));
    var response = await addServiceResponsitory.postService(nameService, linkOn, linkOff, type, fileImage);
    emit(AddServiceLoading(isLoading: false));
    try{
      if(response!=null&&response.data!=null&& response.data['statusCode']==200){
        Navigator.pop(context);
        Utils.toassMessage(response.data['message']);
      }
      if(response!=null&&response.data!=null&& response.data['statusCode']!=200){
        Navigator.pop(context);
        Utils.toassMessage(response.data['message']);
      }
    }catch(e){
      emit(AddServiceLoading(isLoading: false));
      print("Add service icon error: $e");
    }
  }
}
