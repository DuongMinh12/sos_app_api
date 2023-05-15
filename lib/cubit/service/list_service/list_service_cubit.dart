import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/models/list_service_model.dart';
import 'package:warning_app/repositories/list_service_responsitory.dart';

part 'list_service_state.dart';

class ListServiceCubit extends Cubit<ListServiceState> {
  ListServiceCubit() : super(ListServiceInitial());
  ListServiceResponsitory listServiceResponsitory =ListServiceResponsitory();
  ListServiceModel listServiceModel =ListServiceModel();

  List<ListServiceModel>listService=[];

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
}
