import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warning_app/cubit/account/customer_profile/user_pro5_cubit.dart';
import 'package:warning_app/cubit/account/login/login_cubit.dart';

import 'list_bank/list_bank_cubit.dart';

class WrapProvider extends StatelessWidget {
  const WrapProvider({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListBankCubit>(
          create: (BuildContext context) => ListBankCubit(),
        ),
        BlocProvider<LoginCubit>(create: (BuildContext context) => LoginCubit()),
        BlocProvider<UserPro5Cubit>(create: (BuildContext context) => UserPro5Cubit()),
      ],
      child: child,

    );
  }
}