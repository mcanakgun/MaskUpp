import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wear_mask/auth_provider.dart';
import 'package:wear_mask/welcome_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double fontScale = MediaQuery.of(context).textScaleFactor;

    TextEditingController userName = TextEditingController();
    TextEditingController pass = TextEditingController();

    Future<void> signIn() async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userName.text, password: pass.text)
          .then((kullanici) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ),
        );
      }).whenComplete(() => Navigator.pushNamed(context, "/MapHome"));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Background3.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: size.height * 0.14,
              bottom: size.height * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hello, \nStay with MaskUpp",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xfffaf8ed),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: TextFormField(
                      controller: userName,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Email"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: TextFormField(
                      controller: pass,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Password"),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/SignUp");
                    },
                    child: Text(
                      "Create account",
                      style: TextStyle(
                        color: Color(0xfffaf8ed),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () => {signIn()},
                    elevation: 0,
                    color: Color(0xff3d76b5),
                    padding: EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AuthProviderService.instance.signIn();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            width: 20,
                            height: 20,
                            image: AssetImage('assets/google.png')),
                        SizedBox(width: 20),
                        Text(
                          "Sign In With Google",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xfffaf8ed),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
