import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class user extends StatefulWidget {
  const user({super.key});

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("user"),);
  }
}