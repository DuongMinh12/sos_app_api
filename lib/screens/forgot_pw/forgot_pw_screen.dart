import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/constants/utils.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
  static String routeName = 'forgotpwPage';

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,), onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Lottie.asset(forgotpw)),
            Text('Enter your Email and we will send you a password reset link.', style: TextStyle(fontSize: 17,), textAlign: TextAlign.center,),
            SizedBox(height: 15,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                hintText: 'Enter your Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                )
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 45,
                width: 150,
                child: ElevatedButton(onPressed: (){
                  try{
                    FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim()).then((value) {
                       ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text('New password has been sent to your email, please check your email')));
                      //Utils.toassMessage('New password has been sent to your email, please check your email');
                      Future.delayed(Duration(seconds: 4), ()=> Navigator.pop(context));
                    });
                  }on FirebaseAuthException catch(e){
                    print(e);
                  }
                },
                  child: Text('Reset Password'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: kPrimaryColor
                ),))
          ],
        )
      ),
    );
  }
}
