import 'package:flutter/material.dart';
import 'dart:async';
import 'HomePage.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomePage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(203,37,43,1),
        child: Center(child: Text("MOVIEZILLA",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}

