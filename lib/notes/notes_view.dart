import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  _NotesViewState createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Main"), actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      // final user =  FirebaseAuth.instance.currentUser;
                      // print(FirebaseAuth.instance.currentUser);
                    },
                    icon: Icon(Icons.logout)),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert),
              )),
        ]),
        body: Column(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child:IconButton(
                onPressed: () {
                Navigator.pushNamed(
                  context, '/newnote'
                );
                }, 
                icon: Icon(Icons.add),
                iconSize: 38.0,
              ),
            )
          ],
        ));
  }
}
