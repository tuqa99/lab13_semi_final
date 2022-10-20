import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Restpassword extends StatefulWidget {
  const Restpassword({super.key});

  @override
  State<Restpassword> createState() => _RestpasswordState();
}

class _RestpasswordState extends State<Restpassword> {
  TextEditingController _emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' send Request '),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Enter your email',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    controller: _emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true)),
                Center(
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () async {
                      try {
                        await auth.sendPasswordResetEmail(
                            email: _emailController.text.trim());
                        Navigator.of(context).pop();
                        print('please check the email');
                      } catch (e) {
                        print(
                            "An error occured while trying to send email verification");
                        print(e);
                      }
                    },
                    child: Text('send'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
