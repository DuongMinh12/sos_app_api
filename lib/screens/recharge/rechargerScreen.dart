import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:warning_app/constants/add_all.dart';

import '../../cubit/list_bank/list_bank_cubit.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({Key? key}) : super(key: key);
static String routeName = 'rechargeScreen';

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListBankCubit>(context).getListBank();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,),),
      ),
      body: Container(
        alignment: AlignmentDirectional.topCenter,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,),
              child: SvgPicture.asset(login),
            ),
            Expanded(
              child: Container(
                alignment: AlignmentDirectional.topStart,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(
                    color: kPrimaryColor.withAlpha(20),
                    spreadRadius: 5,
                    blurRadius: 7
                  )]
                ),
                child: BlocBuilder<ListBankCubit, ListBankState>
                  (builder: (context,state){
                    if(state is ListBankLoading && state.isLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    if(state is ListBankLoaded){
                      return state.listBankModel.isNotEmpty? Container(
                        child: GridView.builder(
                          itemCount: 8,
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 80,
                            // childAspectRatio: 3/2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10
                            ),
                            itemBuilder: (context, indext){
                          return IconBank(title: local + state.listBankModel[indext].icon.toString(),);
                            })
                      )
                          :Text('Chua co');
                    }
                    return SizedBox();
                },),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IconBank extends StatelessWidget {
  IconBank({ required this.title,
    super.key,
  });
  String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 5),
        child: Image.network(title),
        height: 50,
        width: 70,
        decoration: BoxDecoration(color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8)),),
    );
  }
}
