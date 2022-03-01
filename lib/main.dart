import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_project/notes/create_update_note_view.dart';
import 'package:test_project/notes/notes_view.dart';
import 'package:test_project/views/login_view.dart';
import 'package:test_project/views/logout_view.dart';
import 'package:test_project/views/register_view.dart';
import 'package:test_project/views/verify_email_view.dart';
import 'firebase_options.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      routes: {
        '/login' : (context) => const LoginView(),
        '/register' : (context) => const RegisterView(),
        '/newnote' : (context) => const CreateNoteView(),
        '/notes' : (context) => const NotesView(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home Page')
      //   ),
        body: FutureBuilder(  
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context,snapshot){
            switch (snapshot.connectionState){
              case ConnectionState.done:
                final user = FirebaseAuth.instance.currentUser;
                if(user != null){
                  // if(user.emailVerified){
                  //   return const NotesView();
                  // } else {
                  //   return const VerifyEmailView();
                  // }
                  return const NotesView();
                } else {
                  return const LoginView();
                }
                return const Text('Done');
                
              default:
               return const CircularProgressIndicator();
            }

          },
        ),
    );
  }
}

