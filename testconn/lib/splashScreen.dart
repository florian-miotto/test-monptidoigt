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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 160,
            // horizontal: 20,
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              AnimFondu(
                delay: 500,
                child: Container(
                  height: 200,
                  child: Image.asset('images/logo.png'),
                ),
              ),
                            
            ],
          ),
        ),
      ),
    );
  }
}
