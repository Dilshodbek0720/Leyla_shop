import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Authprovider with ChangeNotifier {
  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController paswordcontroler = TextEditingController();
  final TextEditingController usercontroler = TextEditingController();
  bool isLoading = false;

  loginbuttonpressed() {
    emailcontroler.clear();
    paswordcontroler.clear();
    usercontroler.clear();
  }

  sigupbuttonpressed() {
    emailcontroler.clear();
    paswordcontroler.clear();
  }

  Future<void> signUpuser(BuildContext context) async {
    String emeil = emailcontroler.text;
    String password = paswordcontroler.text;
    try {
      isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emeil, password: password);
      isLoading = false;
      notifyListeners();
    }on FirebaseAuthException catch(e){
      Messagemanage(context, e.code);
      if(e.code=="weak-password"){
        debugPrint("The password provid is too week");
      }
      else if(e.code=="email-alreadiy-in-use"){
        debugPrint("The acount already exists for the email. ");
      }

    }
    catch (e) {
      Messagemanage(context, e.toString());
    }
  }
  Future<void>logOut(BuildContext context)async{
     try{
       isLoading=true;
       notifyListeners();
       await FirebaseAuth.instance.signOut();
       isLoading=false;
       loginbuttonpressed();
       notifyListeners();
     }
     on FirebaseAuthException catch(e){
       if(e.code=="weak-password"){
         debugPrint("The password provid is too week");

       }else if(e.code=="email-already-in use"){
          debugPrint("The acount already exists fro the email.");
       }
     }
     catch(e){}

  }

/*  Future<void>LoginUpuser(BuildContext context)async{
    String user=usercontroler.text;
    String pasword=emailcontroler.text;
    String confirmpasword=paswordcontroler.text;
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email)
    }catch(e){

    }
  }*/
  Messagemanage(BuildContext context,String error){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    isLoading=false;
    notifyListeners();
  }

}