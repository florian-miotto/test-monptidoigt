import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ConnexionPage.dart';

class InscriptionPage extends StatelessWidget {
  final _usernameController = TextEditingController();
final _nameController = TextEditingController();
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned(
            top: 0,
            left: 0,
            right: 0,

            child: Image.asset(
              'images/Up.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFF8FFF7),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -5),
                    blurRadius: 10,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'S\'inscrire',
                    style: GoogleFonts.nunito(
                      color: const Color.fromARGB(255, 34, 87, 104),
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Prénom',
                      labelStyle: GoogleFonts.nunito(
                        color: const Color.fromARGB(195, 184, 184, 184),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      
                    ),
                    controller: _usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer votre Prénom';
                      }
                      return null;
                    },

                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      labelStyle: GoogleFonts.nunito(
                        color: const Color.fromARGB(195, 184, 184, 184),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      
                    ),
                    controller:  _nameController,

                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Veuillez entrer votre Nom';
                    //   }
                    //   return null;
                    // },


                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Adresse mail',
                      labelStyle: GoogleFonts.nunito(
                        color: const Color.fromARGB(195, 184, 184, 184),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      labelStyle: GoogleFonts.nunito(
                        color: const Color.fromARGB(195, 184, 184, 184),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      
                    ),
                  ),
                  
                  
                  //text "Se connecter" + bouton de connexion (rond avec fleche vers la droite)
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'S\'inscrire',
                        style: GoogleFonts.nunito(
                          color: const Color.fromARGB(255, 34, 87, 104),
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 87, 104),
                        shape: BoxShape.circle,                        ),
                        child: const Icon(
                          FontAwesomeIcons.arrowRight,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                   GestureDetector(
                     onTap: () {
                      Navigator.push(
                        
                         context,
                         MaterialPageRoute(builder: (context) =>   LoginPage()),
                         );
                               },
                      child: Text(
                        "Se connecter",
                        style: GoogleFonts.nunito(
                          color: const Color.fromARGB(255, 34, 87, 104),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),                  
                      ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void setState(Null Function() param0) {}
}
class GoogleBtn1 extends StatelessWidget {
final Function() onPressed;
  const GoogleBtn1({
required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 54,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2Fsearch%20(2).png?alt=media&token=24a918f7-3564-4290-b7e4-08ff54b3c94c",
                width: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Google",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ],
          ),
          onPressed: onPressed,
        ));
  }
}
