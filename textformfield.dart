************MainPage.dart**************************
  import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.pink,
      ),
      home:LoginForm(),
    );

  }}
  ***************************LoginForm**************************************************************
   import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("LoginForm")),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'What do people call you?',
                    labelText: 'Name *',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'password',
                    labelText: 'Password *',
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(onPressed: () {}, child: Text('click')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
