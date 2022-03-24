// single file that handles authentication
// create an email field, password field, login button, register button

import 'package:crypto_wallet/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../net/flutterfire.dart';
import 'package:google_fonts/google_fonts.dart';


class Authentication extends StatefulWidget {
  const Authentication({ Key? key }) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return IconButton(
      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
      icon: FaIcon(FontAwesomeIcons.bitcoin), 
      onPressed: () { print("Pressed"); }
     );
  }
}

class _AuthenticationState extends State<Authentication>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,   //expands container to fill max width
        height: MediaQuery.of(context).size.height, //expands container to fill max height
        decoration: BoxDecoration(
          color: Colors.amber.shade600,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.ethereum, size: 100,),
            SizedBox(height: MediaQuery.of(context).size.height / 35,),
            const Text("Crypto Wallet", 
            style: TextStyle(
            fontSize: 35.0,
            color: Colors.black
                ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 15,),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.white),
              controller: _emailField,
              decoration: const InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.white,
                  ),
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),),
            SizedBox(height: MediaQuery.of(context).size.height / 35,),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.white),
              controller: _passwordField,
              obscureText: true,
              decoration: const InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.white,
                  ),
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35,),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async{
                  bool shouldNavigate = await register(_emailField.text, _passwordField.text);
                  if(shouldNavigate) {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => HomeView(key: null,),
                    ),
                    ); 

                  }
                },
                child: const Text("Register"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35,),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async{
                  bool shouldNavigate = await signIn(_emailField.text, _passwordField.text);
                  if(shouldNavigate) {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => HomeView(),
                    ),
                    ); 
                  }
                },
                child: const Text("Log in"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 15,),
            const Text("Made by \n Joseph Hammana", textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 15.0,
            color: Colors.black
                ),
            ),
          ],
        ),
      ),
    );
  }
}

