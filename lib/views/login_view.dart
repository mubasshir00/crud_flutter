import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
        title: const Text('Login'),
      ),
      body: Column(
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
                          // await Firebase.initializeApp(
                          //     options: DefaultFirebaseOptions.currentPlatform);

                          final email = _email.text;
                          final password = _password.text;

                          try {
                          final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email, 
                            password: password
                          );
                          print(userCredential);
                          } on FirebaseAuthException catch(e) {
                            if(e.code == 'user-not-found'){
                              print('User Not Found');
                            } else if(e.code == 'wrong-password'){
                              print('Wrong Password');
                            } else {
                              print(e.code);
                            }
                          }
                          
                        },
                        child: const Text('Login')),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          }, 
                          child: Text(
                            'Register Here !!',
                            
                            )
                        )
                  ],
                )
    );
  }
}
