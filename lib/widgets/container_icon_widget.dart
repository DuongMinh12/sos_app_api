import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warning_app/cubit/service/list_service/list_service_cubit.dart';

import '../constants/add_all.dart';

class ContainerIconWidget extends StatefulWidget {
  ContainerIconWidget({
    required this.type,
    super.key,
  });

  @override
  State<ContainerIconWidget> createState() => _ContainerIconWidgetState();
  String type;
}

class _ContainerIconWidgetState extends State<ContainerIconWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListServiceCubit>(context).getListServiceCubit(widget.type);
  }

  @override
  Widget build(BuildContext context) {
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
                  itemCount: 7,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    // childAspectRatio: 2/3
                  ),
                  itemBuilder: (context, indext) {
                    return InkWell(
                      onTap: (){
                       showDialog(context: context, builder: (context){
                         return buildAlertDialog(context);
                       });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: kPrimaryColor.withAlpha(50),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(catNetword, fit: BoxFit.cover,),
                              ),
                            ),
                            Text('12345678910111213', overflow: TextOverflow.ellipsis,)
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


AlertDialog buildAlertDialog(BuildContext context) {
  return AlertDialog(
    title: Text('Cảnh báo.'),
    content: Column(
      children: [
        Text('Bạn đang thay đổi trạng thái của ${''}, nếu bạn chắc chắn muốn thực hiện thao tác, vui lòng nhập otp bên dưới.'),
        TextFormField()
      ],
    ),
    actions: [
      TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text('Cancle')),
      ElevatedButton(onPressed: (){}, child: Text('Submit code')),
    ],
  );
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