import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warning_app/cubit/service/list_service/list_service_cubit.dart';
import 'package:warning_app/repositories/change_state_service_responsitory.dart';
import '../app_state/app_state.dart';
import '../constants/add_all.dart';
import '../repositories/otp_Cstate_responsitory.dart';
import 'widgets.dart';

class ContainerIconWidget extends StatefulWidget {
  ContainerIconWidget({
    required this.type,
    super.key,
  });

  @override
  State<ContainerIconWidget> createState() => _ContainerIconWidgetState();
  String type;
  ListServiceCubit listServiceCubit = ListServiceCubit();
  TextEditingController otp = TextEditingController();
  OtpChangeStateResponsitory otpChangeStateResponsitory = OtpChangeStateResponsitory();
  bool? check = false;
  ChangeStateServiceResponsitory changeStateServiceResponsitory =ChangeStateServiceResponsitory();
}

class _ContainerIconWidgetState extends State<ContainerIconWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListServiceCubit>(context).getListServiceCubit(widget.type);
    widget.otp;
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.check);
    var id;
    return Expanded(
      child: Container(
        ///Container bự bên ngoài
        alignment: AlignmentDirectional.topStart,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: kPrimaryColor.withAlpha(20), spreadRadius: 5, blurRadius: 7)]),
        child: BlocBuilder<ListServiceCubit, ListServiceState>(
          builder: (context, state) {
            if (state is ListServiceLoading && state.isLoading == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ListServiceLoaded) {
              return GridView.builder(
                  itemCount: state.listService.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    // childAspectRatio: 2/3
                  ),
                  itemBuilder: (context, indext) {
                    return InkWell(
                      onTap: () {
                        AppState.instance.settingBox.write(SettingType.idService.toString(), state.listService[indext].id);
                        // id = state.listService[indext].id;
                        showDialog(
                            context: context,
                            builder: (context) {
                              return BuildAlerdialogChangeState();
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: state.listService[indext].state==1? kPrimaryColor.withAlpha(50): Colors.red,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: (state.listService[indext].avatar != null)
                                    ? Image.network(
                                        localOnline + state.listService[indext].avatar.toString(),
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        catNetword,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            Text(
                              state.listService[indext].name.toString(),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text("Trong đây chưa có gì hớt"),
              );
            }
          },
        ),
      ),
    );
  }
}


// Container(
// padding: EdgeInsets.all(8),
// decoration: BoxDecoration(
// color: kPrimaryColor.withAlpha(50),
// borderRadius: BorderRadius.circular(8)
// ),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(8),
// child: (state.listService[indext].avatar!=null)? Image.network(local + state.listService[0].avatar.toString(),fit: BoxFit.cover,)
// : Image.network(catNetword, fit: BoxFit.cover,),
// ),
// );
