import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leyla_shop/ui/tab_user/profile/widgets/profile_item.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/profile_provider.dart';
import '../../../utils/colors.dart';
import '../../auth/widgets/add_global_button.dart';
import '../../auth/widgets/add_text_fields.dart';

class ProfileUserScreen extends StatefulWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<ProfileProvider>().currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text("PROfIle", style: TextStyle(
          fontFamily: "Cinzel",
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          color: AppColors.C_01AA4F,
        ),),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthProvider>().loginButtonPressed();
                context.read<AuthProvider>().logOutUser(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: user==null ? Icon(
                Icons.person,
                size: 160.h,
                color: Colors.black,
              ) : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.h),
                  border: Border.all(width: 1, color: Colors.greenAccent)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80.h),
                    child: Image.network(user.photoURL!, fit: BoxFit.cover,height: 160.h,)),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  user?.displayName ?? "",
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  user?.email ?? "",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.h,),
            ProfileItem(icon: Icon(Icons.settings, color: Colors.green,size: 32.sp,), text1: "Settings", text2: "Change your setting", onTap: (){}),
            SizedBox(height: 20.h,),
            ProfileItem(icon: Icon(Icons.info, color: Colors.green,size: 32.sp,), text1: "FAQ", text2: "Consult the online help", onTap: (){}),
            SizedBox(height: 20.h,),
            ProfileItem(icon: Icon(Icons.edit, color: Colors.green,size: 32.sp,), text1: "Edit Profile", text2: "Consult the online help", onTap: () {
              setState(() {
                isEdit = !isEdit;
              });
            },),
            SizedBox(
              height: 40.h,
            ),
            Visibility(
              visible: isEdit,
              child: Column(
                children: [
                  AddGlobalTextField(
                    hintText: "Display Name",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.start,
                    controller:
                    context.read<ProfileProvider>().nameController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AddGlobalTextField(
                    hintText: "Email Update",
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.start,
                    controller:
                    context.read<ProfileProvider>().emailController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AddGlobalButton(
                      title: "Save",
                      onTap: () {
                        context
                            .read<ProfileProvider>().updateUsername(context);
                        context
                            .read<ProfileProvider>()
                            .updateEmail(context);
                        // context.read<ProfileProvider>().updateEmail(context);
                        setState(() {
                          isEdit = false;
                        });
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}