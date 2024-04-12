import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.cardColor,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: container,
        ),
      ),
    );
  }
}
