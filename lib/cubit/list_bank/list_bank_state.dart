part of 'list_bank_cubit.dart';

@immutable
abstract class ListBankState extends Equatable {

}

class ListBankInitial extends ListBankState {
  @override
  List<Object?> get props => [];
}

class ListBankLoading extends ListBankState {
  bool isLoading;
  ListBankLoading({this.isLoading = true});


  @override
  List<Object?> get props => [isLoading];
}

class ListBankLoaded extends ListBankState {
 List<ListBankModel>  listBankModel;
  ListBankLoaded({required this.listBankModel});


  @override
  List<Object?> get props => [listBankModel];
}
