import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/models/add_service_data_model.dart';
import 'package:warning_app/repositories/service/add_service_responsitory.dart';
import 'package:warning_app/screens/recharge/rechargerScreen.dart';

part 'add_service_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  AddServiceCubit() : super(AddServiceInitial());
  AddServiceResponsitory addServiceResponsitory =AddServiceResponsitory();
  // AddServiceDataModel addServiceDataModel = AddServiceDataModel();


// List<AddServiceDataModel> listadd =[];
  Future addServiceIcon(BuildContext context, String nameService, String linkOn, String linkOff, String type, var fileImage) async{
    emit(AddServiceLoading(isLoading: true));
    var response = await addServiceResponsitory.postService(nameService, linkOn, linkOff, type, fileImage);
    emit(AddServiceLoading(isLoading: false));
    try{
      if(response!=null&&response.data!=null&& response.data['statusCode']==200){
        // listadd = (response.data['data'] as List).map((e) => AddServiceDataModel.fromJson(e)).toList();
        Utils.toassMessage(response.data['message']);
      }
      if(response!=null&&response.data!=null&& response.data['statusCode']!=200){
        // Navigator.pop(context);
        Utils.toassMessage(response.data['message']);
      }
      // emit(AddServiceLoaded(addServiceDataModel: listadd));
    }catch(e){
      emit(AddServiceLoading(isLoading: false));
      print("Add service icon error: $e");
    }
  }
}
