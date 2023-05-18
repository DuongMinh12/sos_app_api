import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/models/list_service_model.dart';
import 'package:warning_app/repositories/service/change_state_service_responsitory.dart';
import 'package:warning_app/repositories/service/list_service_responsitory.dart';

part 'list_service_state.dart';

class ListServiceCubit extends Cubit<ListServiceState> {
  ListServiceCubit() : super(ListServiceInitial());
  ListServiceResponsitory listServiceResponsitory =ListServiceResponsitory();
  ListServiceModel listServiceModel =ListServiceModel();
  ChangeStateServiceResponsitory changeStateResponsitory = ChangeStateServiceResponsitory();
  // StateServiceModel stateServiceModel = StateServiceModel();

  List<ListServiceModel>listService=[];
  // List<StateServiceModel>listState=[];

  Future getListServiceCubit(String type) async{
    emit(ListServiceLoading(isLoading: true));
    var response = await listServiceResponsitory.getListService(type);
    try{
      if(response!=null && response.data!=null&& response.data['statusCode']==200){
        listService = (response.data['data'] as List).map((e) => ListServiceModel.fromJson(e)).toList();
        // print(response.data['data']);
      }
      if(response!=null && response.data!=null && response!.data['statusCode']!=200){
        emit(ListServiceLoading(isLoading: false));
        Utils.toassMessage('Tải thất bại');
      }
      emit(ListServiceLoading(isLoading: false));
      emit(ListServiceLoaded(listService: listService));
    }catch(e){
      emit(ListServiceLoading(isLoading: false));
      print('Get list service error: $e');
    }
  }


  // Future changeStateService(String idService, String otp) async{
  //   emit(StateServiceLoading(isLoading: true));
  //   var response = await changeStateResponsitory.putChangeState(idService, otp);
  //   emit(StateServiceLoading(isLoading: false));
  //   try{
  //     if(response!=null&&response.data!=null&&response.data['statusCode']==200){
  //       stateServiceModel = StateServiceModel.fromJson(response.data['data']);
  //       if(response.data['data']['link_on']!=null){
  //         return true;
  //       }
  //       if(response.data['data']['link_off']!=null){
  //         return false;
  //       }
  //       // listState = (response.data['data'] as List).map((e) => StateServiceModel.fromJson(e)).toList();
  //     }
  //     if(response!=null&&response.data!=null&&response.data['statusCode']!=200){
  //       Utils.toassMessage(response.data['message']);
  //     }
  //     // emit(StateServiceLoaded(listState: stateServiceModel));
  //   }catch(e){
  //     emit(StateServiceLoading(isLoading: false));
  //     print('Put State service cubit error: $e');
  //   }
  // }
}
