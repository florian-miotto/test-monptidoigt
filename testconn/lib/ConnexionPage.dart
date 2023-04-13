import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'inscription_page.dart';
import 'connex_page.dart';
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
 
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoading = false;
  bool _rememberMe = false;
  get http => null;
      Future<void> _handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
      // Handle the sign in process and navigate to the next screen.
    } catch (error) {
      // Handle sign in error (e.g., display an error message).
    }
  }
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
                    'Connexion',
                    style: GoogleFonts.nunito(
                      color: const Color.fromARGB(255, 34, 87, 104),
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Adresse mail',
                      labelStyle: GoogleFonts.nunito(
                        color: const Color.fromARGB(195, 184, 184, 184),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      // prefixIcon: const Icon(
                      //   FontAwesomeIcons.envelope,
                      //   color: Color.fromARGB(255, 160, 160, 160),
                      // ),
                    ),
                    controller: _usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer votre adresse mail';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      labelStyle: GoogleFonts.nunito(
                        color: const Color.fromARGB(195, 184, 184, 184),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer votre mot de passe';
                      }
                      return null;
                    },
                  ),
                  //bouton radio pour se souvenir de moi
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      Text(
                        'Se souvenir de moi',
                        style: GoogleFonts.nunito(
                          color: const Color.fromARGB(255, 34, 87, 104),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Se connecter avec',
                    style: GoogleFonts.nunito(
                      color: const Color.fromARGB(255, 34, 87, 104),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GoogleBtn1(onPressed: _handleGoogleSignIn),
                      // Icon(
                      //   FontAwesomeIcons.google,
                      //   color: Color.fromARGB(255, 34, 87, 104),
                      // ),
                      FacebookBtn1(onPressed: () {}),
                      TwitterBtn1(
                        onPressed: () {},
                      ),
                      SizedBox(width: 1),

                      // Icon(
                      //   FontAwesomeIcons.facebook,
                      //   color: Color.fromARGB(255, 34, 87, 104),
                      // ),
                    ],
                  ),
                  //text "Se connecter" + bouton de connexion (rond avec fleche vers la droite)
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Se connecter',
                        style: GoogleFonts.nunito(
                          color: const Color.fromARGB(255, 34, 87, 104),
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: _submit,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 34, 87, 104),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //text "s'inscrire" ->lien vers la page d'inscription
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InscriptionPage()),
                      );
                    },
                    child: Text(
                      "S'inscrire",
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

  // void setState(Null Function() param0) {}

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      // URL du service web d'authentification RESTful
      final url = Uri.parse('https://mon-service-web.com/authenticate');

      final response = await http.post(
        url,
        body: json.encode({'username': username, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // L'authentification est réussie
        // Naviguer vers la page d'accueil de l'application
      } else {
        // L'authentification a échoué
        final error = json.decode(response.body)['error'];
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Erreur d\'authentification'),
            content: Text(error),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }

      setState(() {
        _isLoading = false;
      });
    }
  }
}

class FacebookBtn1 extends StatelessWidget {
  final Function() onPressed;
  const FacebookBtn1({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 54,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -5),
              blurRadius: 10,
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
          ],
        ),
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2Ffacebook%20(2).png?alt=media&token=9c275bf0-2bf7-498a-9405-9ae99df8d8f2",
                width: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Facebook",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ],
          ),
          onPressed: onPressed,
        ));
  }
}

Future<void> _submit() async {
  // ...
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
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -5),
              blurRadius: 10,
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
          ],
        ),
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)))),
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

class TwitterBtn1 extends StatelessWidget {
  final Function() onPressed;
  const TwitterBtn1({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 54,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -5),
              blurRadius: 10,
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
          ],
        ),
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/socials%2Ftwitter.png?alt=media&token=abd55874-2c77-4322-88e0-aa7598ee2a10",
                width: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Twitter",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ],
          ),
          onPressed: onPressed,
        ));
  }
}
