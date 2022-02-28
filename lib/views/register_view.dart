import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './../firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return (Column(
                  children: [
                    TextField(
                      controller: _email,
                      autocorrect: false,
                      enableSuggestions: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: 'Enter Email Address'),
                    ),
                    TextField(
                      controller: _password,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: 'Enter Password',
                      ),
                    ),
                    TextButton(
                        onPressed: () async {
                          await Firebase.initializeApp(
                              options: DefaultFirebaseOptions.currentPlatform);

                          final email = _email.text;
                          final password = _password.text;

                          try {
                            final userCredential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email, password: password);
                            print(userCredential);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('Weak Password');
                            } else if (e.code == 'email-already-in-use') {
                              print('Email Already In Use');
                            } else {
                              print(e);
                            }
                          }
                        },
                        child: const Text('Register')
                      ) ,
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context, '/login'
                          );
                        }, 
                        child: const Text('Login')
                      )
                  ],
                ));
              default:
                return const Text('Loading...');
            }
          },
        ));
  }
}
