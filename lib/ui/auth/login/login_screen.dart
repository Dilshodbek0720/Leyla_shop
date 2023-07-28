import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leyla_shop/ui/auth/widgets/global_button.dart';
import 'package:leyla_shop/ui/auth/widgets/global_text_field.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/icons.dart';
import '../sign/sign_screen.dart';

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
          GlobalTextField(hintext: "Enter your email", controller: context.read<AuthProvider>().emailController,),
          const SizedBox(height: 20,),
          GlobalTextField(hintext: "Enter your password", controller: context.read<AuthProvider>().passwordController,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 28),
            child: GlobalButton(onTap: (){
              context.read<AuthProvider>().logInUser(context);
            }, borderColor: AppColors.C_01AA4F, color: AppColors.C_01AA4F, textColor: AppColors.white, text: "Login"),
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
          GlobalButton(onTap: (){
            context.read<AuthProvider>().signUpButtonPressed();
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const SignUpScreen();
            }));
          }, borderColor: AppColors.C_999999.withOpacity(0.2), color: AppColors.C_F5F7F9.withOpacity(0.62), textColor: AppColors.black.withOpacity(0.4), text: "Sign Up")
        ],
      ),
    );
  }
}
