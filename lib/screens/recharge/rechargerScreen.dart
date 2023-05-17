import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warning_app/cubit/service/add_service/add_service_cubit.dart';
import '../../cubit/list_bank/list_bank_cubit.dart';
import '../../widgets/widgets.dart';

class RechargeScreen extends StatelessWidget {
  const RechargeScreen({Key? key}) : super(key: key);
  static String routeName = 'rechargeScreen';

  @override
  Widget build(BuildContext context) {
    return BackGroundButtonWidget(
      routename: RechargeScreen.routeName,
      type: 'khoanap',
      child: ContainerIconWidget(type: 'khoanap', navigat: RechargeScreen.routeName,),
      title: 'Khóa Nạp Tiền',
    );
  }
}

// IconBank(
// title: local + state.listBankModel[indext].icon.toString(),
// );

// BlocBuilder<ListBankCubit, ListBankState>(
// builder: (context, state) {
// if (state is ListBankLoading && state.isLoading) {
// return Center(
// child: CircularProgressIndicator(),
// );
// }
// if (state is ListBankLoaded) {
// if (state.listBankModel != null) {
// return Container(
// child: GridView.builder(
// itemCount: state.listBankModel.length,
// gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
// maxCrossAxisExtent: 80,
// // childAspectRatio: 3/2,
// mainAxisSpacing: 10,
// crossAxisSpacing: 10),
// itemBuilder: (context, indext) {
// return  InkWell(
// onTap: (){
// var idbank = state.listBankModel[indext].id;
// AppState.instance.settingBox.write(SettingType.bankid.toString(), idbank);
// },
// child: IconBank(
// title: local + state.listBankModel[indext].icon.toString(),
// ),
// );
// }));
// } else {
// return Text('Chưa có');
// }
// }
// return SizedBox();
// },
// )

class IconBank extends StatelessWidget {
  IconBank({
    required this.title,
    super.key,
  });
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 5),
      child: Image.network(title),
      height: 50,
      width: 70,
      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
    );
  }
}
