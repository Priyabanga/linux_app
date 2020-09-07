import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyLinux extends StatefulWidget {
  @override
  _MyLinuxState createState() => _MyLinuxState();
}

class _MyLinuxState extends State<MyLinux> {
  String cmd;
  var webdata;
  var fsconnect = FirebaseFirestore.instance;

  executeCommand(cmd) async {
    var url = "http://192.168.29.155/cgi-bin/web.py?x=${cmd}";
    var r = await http.get(url);

    setState(() {
      webdata = r.body;
    });
    fsconnect.collection("commands").add({
      'cmd': cmd,
      'output': webdata,
    });
    //print("Clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Linux Terminal",
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
            //height: double.infinity,
            padding: EdgeInsets.only(left: 190),
            alignment: Alignment.bottomRight,
            color: Colors.black45,
            child: Image.asset("assets/redhat-linux-enterprise-8.png"),
          ),
          Center(
            child: Container(
              width: 380,
              height: 345,
              color: Colors.black,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 380,
                        color: Colors.grey.shade700,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(90, 10, 0, 10),
                              child: Text(
                                "root@localhost:~",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.pushNamed(context, "home");
                              },
                              padding: EdgeInsets.fromLTRB(70, 10, 10, 10),
                              alignment: Alignment.center,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          cmd = value;
                        },
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Enter command...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                        elevation: 10,
                        child: MaterialButton(
                          minWidth: 100,
                          height: 40,
                          child: Text(
                            "Run",
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          onPressed: () {
                            executeCommand(cmd);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        webdata ?? "output is coming...",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
