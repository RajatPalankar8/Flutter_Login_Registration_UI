import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_ui/GetXExample/Screen/Dashboard.dart';
import 'package:flutter_login_ui/GetXExample/Screen/LoginPage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';


class FirebaseController extends GetxController{

  FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  Rxn<User> _firebaseUser = Rxn<User>();


 String get user => _firebaseUser.value?.email;
 String get imageurl =>_firebaseUser.value?.photoURL;


  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());

     print(" Auth Change :   ${_auth.currentUser}");

  }

  // function to createuser, login and sign out user

 void createUser(String firstname,String lastname,String email,String password) async
 {

   CollectionReference reference = FirebaseFirestore.instance.collection("Users");

   Map<String,String> userdata ={
     "First Name": firstname,
      "Last Name": lastname,
      "Email":email
   };

   await _auth.createUserWithEmailAndPassword(email: email, password: password).
   then((value) {

     reference.add(userdata).then((value) =>  Get.offAll(LoginPage()));
   }).catchError((onError)=>
       Get.snackbar("Error while creating account ", onError.message),
   );
 }

 void login(String email,String password) async
 {
   await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) => Get.offAll(Dashboard())).
       catchError((onError)=>
   Get.snackbar("Error while sign in ", onError.message));
 }

 void signout() async{
 await _auth.signOut().then((value) => Get.offAll(LoginPage()));

 }


 void sendpasswordresetemail(String email) async{
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(LoginPage());
      Get.snackbar("Password Reset email link is been sent", "Success");
    }).catchError((onError)=> Get.snackbar("Error In Email Reset", onError.message) );
 }

 void deleteuseraccount(String email,String pass) async{
    User user = await _auth.currentUser;

    AuthCredential credential = EmailAuthProvider.credential(email: email, password: pass);

    await user.reauthenticateWithCredential(credential).then((value) {
      value.user.delete().then((res) {
        Get.offAll(LoginPage());
        Get.snackbar("User Account Deleted ", "Success");
      });
    }

    ).catchError((onError)=> Get.snackbar("Credential Error", "Failed"));
  }

 void google_signIn() async{

    final GoogleSignInAccount googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken
    );

    final User user = (await _auth.signInWithCredential(credential).then((value) => Get.offAll(Dashboard())));
 }

 void google_signOut() async{
    await googleSignIn.signOut().then((value) => Get.offAll(LoginPage()));
 }

  Future<Null> fb_login() async {
    final FacebookLoginResult result =
    await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }


}