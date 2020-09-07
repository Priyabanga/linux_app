import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Live Linux CLI",
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
            //width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/cover1.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            // child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                        fontSize: 24,
                        fontFamily: 'Georgia',
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "reg");
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Material(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                  elevation: 10,
                  child: MaterialButton(
                    minWidth: 200,
                    height: 40,
                    child: Text("Login",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Georgia',
                          fontStyle: FontStyle.italic,
                        )),
                    onPressed: () {
                      Navigator.pushNamed(context, "login");
                    },
                  ),
                ),
              ],
            ),
            //  ),
          )
        ],
      ),
    );
  }
}
