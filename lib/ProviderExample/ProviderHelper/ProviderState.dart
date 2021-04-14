import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ProviderState extends ChangeNotifier{

  String _Uid,_Email;

  String get getUD => _Uid;

  String get getEmail => _Email;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> CreateUserAccount(String email,String password) async{

    bool success = false;
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      if(userCredential!=null)
        {
          _Uid = userCredential.user.uid;
          _Email = userCredential.user.email;

          return success =true;
        }
    }catch(e)
    {

    }
    return success;
  }

  Future<bool> SignInUserAccount(String email,String password) async{

    bool success = false;
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      if(userCredential!=null)
      {
        _Uid = userCredential.user.uid;
        _Email = userCredential.user.email;

        return success =true;
      }
    }catch(e)
    {

    }
    return success;
  }

  void signOut() async{
    await _auth.signOut();
  }
}