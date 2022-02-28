import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_project/views/login_view.dart';
import 'package:test_project/views/register_view.dart';
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
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page')
        ),
        body: FutureBuilder(  
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context,snapshot){
            switch (snapshot.connectionState){
              case ConnectionState.done:
                 return const LoginView();
                // final user = FirebaseAuth.instance.currentUser;
                // if(user?.emailVerified ?? false){
                //   // return const Text('Done');
                // } else {
                //   // return const VerifyEmailView();
                //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VerifyEmailView()));
                // }
                // return const Text('Done');
              default:
               return const Text('Loading....');
            }
          },
        ),
    );
  }
}

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({ Key? key }) : super(key: key);

  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Column( 
         children: [
           Text('Verify your Email'),
           TextButton(
             onPressed: () async {
               final user = FirebaseAuth.instance.currentUser;
               await user?.sendEmailVerification();
             },
             child: const Text('Send Email Verification'),
           )
         ],
        );
  }
}