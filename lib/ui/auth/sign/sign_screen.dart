import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/icons.dart';
import '../widgets/global_button.dart';
import '../widgets/global_text_field.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_F5F7F9.withOpacity(0.92),
      body: ListView(
        children: [
          const SizedBox(height: 55,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const Text("Create\nNew Account", style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                fontFamily: "Roboto",
                color: AppColors.C_01AA4F
            ),),
          ),
          const SizedBox(height: 40,),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                height: 85,
                width: 85,
                child: SvgPicture.asset(AppIcons.signIcon),
              ),
            ],
          ),
          const SizedBox(height: 40,),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text("Sign Up", style: TextStyle(
                fontSize: 25,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
                color: AppColors.C_666666
            ),),
          ),
          SizedBox(height: 40,),
          GlobalTextField(hintext: "Enter your email", controller: context.read<AuthProvider>().emailController,),
          SizedBox(height: 20,),
          GlobalTextField(hintext: "Enter your password", controller: context.read<AuthProvider>().passwordController,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 28),
            child: GlobalButton(onTap: ()async{
              await context.read<AuthProvider>().signUpUser(context);
              print(context.read<AuthProvider>().isSign);
              if(context.read<AuthProvider>().isSign){
                Navigator.pop(context);
              }
            }, borderColor: AppColors.C_01AA4F, color: AppColors.C_01AA4F, textColor: AppColors.white, text: "Sign Up"),
          ),
          SizedBox(height: 12,),
          TextButton(
              onPressed: () async{
                await context.read<AuthProvider>().signInWithGoogle(context);
                if(context.read<AuthProvider>().isGoogle){
                  Navigator.pop(context);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sign Up with Google", style: TextStyle(fontSize: 14),),
                  const SizedBox(width: 12),
                  SvgPicture.asset(AppIcons.googleIcon, height: 30, width: 30,)
                ],
              )),
          SizedBox(height: 10,),
          GlobalButton(onTap: (){
            context.read<AuthProvider>().loginButtonPressed();
            Navigator.pop(context);
          }, borderColor: AppColors.C_999999.withOpacity(0.2), color: AppColors.C_F5F7F9.withOpacity(0.62), textColor: AppColors.black.withOpacity(0.4), text: "Login")
        ],
      ),
    );
  }
}