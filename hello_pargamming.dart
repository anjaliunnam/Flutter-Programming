import 'package:flutter/material.dart';
// import 'package:hello_applcation/hello_page.dart';

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
      home: HelloApplication(),
    );

  }}
  

  class HelloApplication extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text('Hello Application'),

      ),
      body: Container(child: Center(child: Text('Hello this is first application')),),

    );
  }
}
