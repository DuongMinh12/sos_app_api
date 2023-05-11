import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:get/get.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:warning_app/controllers/signup_controller.dart';
import 'package:warning_app/cubit/account/register/register_cubit.dart';
import 'package:warning_app/validator/validator.dart';

import '../../../constants/add_all.dart';
import '../../login/components/components_login.dart';

class SignUpTextfield extends StatefulWidget {
  SignUpTextfield({
    super.key,
  });

  @override
  State<SignUpTextfield> createState() => _SignUpTextfieldState();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _usernameControllersg = TextEditingController();
  TextEditingController _emailControllersg = TextEditingController();
  TextEditingController _passControllersg = TextEditingController();
  final passNotifier = ValueNotifier<PasswordStrength?>(null);
  late RegisterCubit registerCubit;
}

class _SignUpTextfieldState extends State<SignUpTextfield> {
  // final controller = Get.put(SignUpController());
  // TextEditingController _phoneControllersg =TextEditingController();

  @override
  void initState() {
    super.initState();
    widget._usernameControllersg;
    widget._emailControllersg;
    widget._passControllersg;
    widget.passNotifier;
    widget.registerCubit = BlocProvider.of<RegisterCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key:  widget._key,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildTextFormFile(
            isPass: false,
            // obscureText: false,
            controller:  widget._usernameControllersg,
            prefixIcon: Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            title: 'Username',
            validator: (String? value) => ValidatorClass.validateUserName(value),
          ),
          BuildTextFormFile(
            isPass: false,
            // obscureText: false,
            controller:  widget._emailControllersg,
            prefixIcon: Icon(
              Icons.email,
              color: kPrimaryColor,
            ),
            title: 'Email',
            validator: (String? value) => ValidatorClass.validatorEmail(value),
          ),
          BuildTextFormFile(
            onchange: (value) {
              widget.passNotifier.value = PasswordStrength.calculate(text: value);
            },
            isPass: true,
            // obscureText: true,
            controller:  widget._passControllersg,
            prefixIcon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            title: 'Password',
            validator: (String? value) => ValidatorClass.validatePassword(value),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                // padding: EdgeInsets.symmetric(horizontal: 46, vertical: 5),
                child: PasswordStrengthChecker(
                  strength:  widget.passNotifier,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state){
                if(state is RegisterLoading&& state.isLoading==true){
                  return Center(child: CircularProgressIndicator(),);
                }
                  return ElevatedButton(
                    onPressed: () {
                      if ( widget._key.currentState!.validate()) {
                        widget.registerCubit.postRegister(context,  widget._usernameControllersg.text.toString(),  widget._emailControllersg.text.toString(),  widget._passControllersg.text.toString());
                      }
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(minimumSize: Size(320, 40), backgroundColor: kPrimaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  );
              }),
            ],
          )
        ],
      ),
    );
  }
}
