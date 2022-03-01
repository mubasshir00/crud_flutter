import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './../firebase_options.dart';

class LogoutView extends StatefulWidget {
  const LogoutView({ Key? key }) : super(key: key);
  
  @override
  _LogoutViewState createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  @override
  Widget build(BuildContext context) {
    print('Working !!!');
    
    return Scaffold(
      body: Column(
        children: [
          Text('Working')
        ],
      ),
    );
  }
}