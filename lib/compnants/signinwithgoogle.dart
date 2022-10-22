import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lab_13_1/screens/Firstscreen.dart';

class SigninGoogle extends StatefulWidget {
  const SigninGoogle({super.key});

  @override
  State<SigninGoogle> createState() => _SigninGoogleState();
}

class _SigninGoogleState extends State<SigninGoogle> {
  // function to implement the google signin

// creating firebase instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => FirstScreen()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 33,
        color: Colors.teal[100],
        elevation: 55,
        child: Row(
          children: [
            Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/2.jpg'), fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text("Sign In with Google")
          ],
        ),

        // by onpressed we call the function signup function
        onPressed: () {
          signup(context);
        });
  }
}
