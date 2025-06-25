import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      appBar: AppBar(title: Text('Home Page'), centerTitle: true),

      body: Center(child: Text('This is the home page')),
    );
  }
}
