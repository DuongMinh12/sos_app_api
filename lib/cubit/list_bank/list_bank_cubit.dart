import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:warning_app/models/list_bank_model.dart';
import 'package:warning_app/repositories/bank_repository.dart';

part 'list_bank_state.dart';

class ListBankCubit extends Cubit<ListBankState> {
  ListBankCubit() : super(ListBankInitial());
  BankResponsitory bankResponsitory=BankResponsitory();

List<ListBankModel>listBank=[];
  Future getListBank() async{
    try {
      emit(ListBankLoading(isLoading: true));
      final res = await bankResponsitory.fetchBankList();
      if(res!=null&&res.data!=null){
        listBank=(res.data['data'] as List).map((e) => ListBankModel.fromJson(e)).toList();
        emit(ListBankLoading(isLoading: false));
        emit(ListBankLoaded(listBankModel: listBank));
      }
    } catch(e){
      emit(ListBankLoading(isLoading: false));
      print(e.toString());
    }

  }

}
