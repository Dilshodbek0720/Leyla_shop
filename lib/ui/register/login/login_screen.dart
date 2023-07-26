import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leyla_shop/ui/register/sign/sign_screen.dart';
import 'package:leyla_shop/utils/images.dart';
import '../../../utils/colors.dart';
import '../../../utils/icons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_F5F7F9.withOpacity(0.92),
      body: ListView(
        children: [
          const SizedBox(height: 55,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const Text("Welcome\nBack", style: TextStyle(
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
                child: SvgPicture.asset(AppIcons.loginIcon),
              ),
            ],
          ),
          const SizedBox(height: 40,),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text("Login", style: TextStyle(
              fontSize: 25,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              color: AppColors.C_666666
            ),),
          ),
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  color: AppColors.C_666666
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.C_666666,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.C_666666,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    color: AppColors.C_666666
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.C_666666,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.C_666666,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 28),
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.C_01AA4F,
              borderRadius: BorderRadius.circular(25)
            ),
            child: const Center(child: Text("Login",style: TextStyle(
                fontSize: 20,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
                color: AppColors.white
            ),
            ),),
          ),
          const SizedBox(height: 30,),
          Column(children: [
            const Text("Forgot password", style: TextStyle(fontWeight: FontWeight.w400,
            fontSize: 16,
              color: AppColors.C_999999,
              fontFamily: "Roboto"
            ),),
            Container(height: 1,width: 125,color: AppColors.C_999999,)
          ],),
          const SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const SignUpScreen();
              }));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.C_999999.withOpacity(0.2)),
                  color: AppColors.C_F5F7F9.withOpacity(0.62),
                  borderRadius: BorderRadius.circular(25)
              ),
              child: const Center(child: Text("Sign Up",style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                  color: AppColors.white
              ),
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
