import 'package:flutter/material.dart';
import 'AnimFondu.dart';
import 'ConnexionPage.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConnexionPage()),
      );
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 20,
          ),
          child: Column(
            children: [
              AnimFondu(
                delay: 500,
                child: Container(
                  height: 200,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              AnimFondu(
                delay: 1500,
                child: Container(
                  height: 200,
                  child: Image.asset('images/up.png'),
                ),
              ),
              AnimFondu(
                delay: 1800,
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 30,
                  ),
                  child: Text(
                    'Mon ptit doigt',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
