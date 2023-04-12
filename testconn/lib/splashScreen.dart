import 'package:flutter/material.dart';
import 'package:testconn/inscription_page.dart';
import 'AnimFondu.dart';
import 'ConnexionPage.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InscriptionPage()),
      );
    });

    return Scaffold(
      body: Center(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            
          ),
          child: Column(
            children: [
              AnimFondu(
                delay: 100,
                child: Container(
                  height: 200,
                  child: Image.asset('images/logo.png'),
                ),
              ),
                           
            ],

          ),
        ),
      ),
    ),
    );
  }
}
