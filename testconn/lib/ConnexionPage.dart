import 'package:flutter/material.dart';
import 'AnimFondu.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConnexionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimFondu(
              delay: 500,
              child: Container(
                // child: Image.asset('images/logo.jpg'),
                child: Image.asset('images/favico.png'),
              ),
            ),
            AnimFondu(
              delay: 500,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 40,
                ),
                child:Column(
                  children: [
                    Text(
                      'Connexion',
                      style: GoogleFonts.nunito(
                        color: Color.fromARGB(255, 34, 87, 104),
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    
                ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
