import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/Adminpage.dart';
import '../screens/Firstscreen.dart';
import '../screens/userpage.dart';

class NameEnter extends StatelessWidget {
  NameEnter({super.key});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: _nameController,
              obscureText: false,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true)),
          Text(
            'Email Id',
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
          Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true)),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              if (_emailController.text.contains('@admin')) {
                try {
                  var authenticationobject = FirebaseAuth.instance;

                  UserCredential myUser =
                      await authenticationobject.createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Welcom Back")));
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AdminPage();
                    },
                  ));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("sorry your data is not correct")));
                }
              } else {
                try {
                  var authenticationobject = FirebaseAuth.instance;

                  UserCredential myUser =
                      await authenticationobject.createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Welcom Back")));
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return UserPage();
                    },
                  ));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("sorry your data is not correct")));
                }
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(2, 4),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xfffbb448), Color(0xfff7892b)])),
              child: Text(
                'Register Now',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EmailEnter extends StatelessWidget {
  EmailEnter({super.key});
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Email Id',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter Password',
              ),
            ),
          ),
          TextField(
              controller: _emailController,
              obscureText: false,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }
}
