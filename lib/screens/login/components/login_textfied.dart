import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/controllers/login_controller.dart';
import 'package:warning_app/validator/validator.dart';

import '../../../constants/add_all.dart';
import '../../screens.dart';
import 'components_login.dart';


class LoginTextfield extends StatefulWidget {
  LoginTextfield({
    super.key,
  });

  @override
  State<LoginTextfield> createState() => _LoginTextfieldState();
}

class _LoginTextfieldState extends State<LoginTextfield> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    LoginWithApi(context, _emailController.text, _passController.text);
  }

  @override
  Widget build(BuildContext context) {

    // Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          BuildTextFormFile(
            isPass: false,
            // obscureText: false,
            controller: _emailController,
            prefixIcon: Icon(
              Icons.email,
              color: kPrimaryColor,
            ),
            title: 'Email',
            validator: (String? value) => ValidatorClass.validatorEmail(value),
          ),
          BuildTextFormFile(
            isPass: true,
            // obscureText: true,
            controller: _passController,
            prefixIcon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            title: 'Password',
            validator: (String? value) => ValidatorClass.validatePassword(value),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        LoginWithApi(context, _emailController.text, _passController.text);
                      }
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        //minimumSize: Size(size.width*0.8, 45),
                      // padding: EdgeInsets.symmetric(horizontal: 10),
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.fingerprint),
                  style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Forgot Password? '),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, ForgotPasswordPage.routeName);
                }, child: Text('Forgot'),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero
                  ),
                ),
              ],),
          ),
        ],
      ),
    );
  }
}


