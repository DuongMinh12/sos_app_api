import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/repositories/service/update_service_responsitory.dart';

part 'update_service_state.dart';

class UpdateServiceCubit extends Cubit<UpdateServiceState> {
  UpdateServiceCubit() : super(UpdateServiceInitial());
  UpdateServiceResponsitory updateServiceResponsitory = UpdateServiceResponsitory();

  Future updateService(String nameService, String linkOn, String linkOff, var pickerFile, String idService) async{
    emit(UpdateServiceLoading(isLoading: true));
    var respone = await updateServiceResponsitory.putUpdateService(nameService, linkOn, linkOff, pickerFile, idService);
    emit(UpdateServiceLoading(isLoading: false));
    try{
      if(respone!=null&&respone.data!=null){
        Utils.toassMessage(respone.data['message']);
      }
      else{
        Utils.toassMessage('Update service lỗi.');
      }
    }catch(e){
      emit(UpdateServiceLoading(isLoading: false));
      print('updateService error: $e');
    }
  }
}
