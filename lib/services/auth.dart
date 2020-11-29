
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notchat/modal/user.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthMethods{

   FirebaseAuth _auth;


  User _userFromFirebaseUser( user){
    return user != null? user.uid:null ;

  }

  Future initializeFirebase()async{
    await Firebase.initializeApp();
    _auth=FirebaseAuth.instance;
  }

 Future signInWithEmailAndPassword(String email,String password) async{

try{
  var result= await _auth.signInWithEmailAndPassword(email: email, password: password);
  User firebaseUser=result.user;
  return _userFromFirebaseUser(firebaseUser);

}catch(e){
  print(e.toString());
}
  }

  Future signUpWithEmailAndPassword(String email,String password)async{


   try{
     var result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
     User firebaseUser=result.user;
     return _userFromFirebaseUser(firebaseUser);

   }catch(e)
    {
      print(e.toString());
    }
  }

  Future signOut()async{


    try{

      return await _auth.signOut();


    }catch(e)
    {
      print(e.toString());
    }
  }


  Future resetPass(String email)async
  {

    return _auth.sendPasswordResetEmail(email: email);
  }
}