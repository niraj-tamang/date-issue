import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webengage_flutter/webengage_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String log = "";
  @override
  void initState() {

    WebEngagePlugin.userLogin('14867');
    //logged
    super.initState();
  }

  @override
  void dispose() {
    WebEngagePlugin.userLogout();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Id: 14867"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Option 1: As per Documentation"),
              Text("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" ,style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              ElevatedButton(onPressed: (){


                Random rand = Random();
                var next = rand.nextInt(1000);

                final DateTime now = DateTime.now();
                final DateFormat formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

                var map = {
                  'Identifier': "Request On: $next",
                  'Date': formatter.format(now),
                };


                WebEngagePlugin.trackEvent("TestFormat", map);


                setState(() {
                  log = "$log\n $map";
                });

              }, child: Text("Log Event: Date Issue")),
              SizedBox(height: 32,),


              Text("Option 2: Your Suggestion"),
              Text("yyyy-MM-ddTHH:mm:ss.SSSZ", style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              ElevatedButton(onPressed: (){

                Random rand = Random();
                var next = rand.nextInt(1000);

                final DateTime now = DateTime.now();
                final DateFormat formatter = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ");

                var msg  = "";


                try {

                  var map = {
                    'Identifier': "Request On: $next",
                    'Date': formatter.format(now),
                  };

                  msg = "$map";

                  WebEngagePlugin.trackEvent("TestFormat", map);
                } catch (e, sn) {
                  msg = "$msg Exep: ${e.toString()}";
                  // print(e);
                }


                setState(() {
                  log = "$log\n $msg";
                });

              }, child: Text("Log Event: Date Issue")),


              SizedBox(height: 16,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Text( "Log Sent Request"),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      log = "";
                    });
                  }, child: Text("Clear Log"))
                ],
              ),
              Text("$log")


            ],
          ),
        ),
      ),
    );
  }
}
