import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  var authc = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            color: Colors.red,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(left: 190),
            alignment: Alignment.bottomRight,
            color: Colors.black45,
            child: Image.asset("assets/redhat-linux-enterprise-8.png"),
          ),
          Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter your password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                    elevation: 10,
                    child: MaterialButton(
                      minWidth: 200,
                      height: 40,
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      onPressed: () async {
                        try {
                          var user = await authc.createUserWithEmailAndPassword(
                              email: email, password: password);
                          print(user);
                          print(email);
                          print(password);

                          if (user.additionalUserInfo.isNewUser == true) {
                            Navigator.pushNamed(context, "login");
                          }
                        } catch (e) {
                          Fluttertoast.showToast(
                              msg: "User already exists",
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 10,
                              backgroundColor: Colors.grey,
                              textColor: Colors.black,
                              fontSize: 22.0);
                          print(e);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    child: Text(
                      "Already have an account!!",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        color: Colors.blueGrey.shade400,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "login");
                    },
                    //color: Colors.black12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
