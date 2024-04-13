import 'package:flutter/material.dart';
import 'package:plant_app_flutter/screens/login_screen.dart';
import 'package:plant_app_flutter/screens/signup_screen.dart';
class Splash extends StatelessWidget {
  const Splash({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://media.istockphoto.com/id/1283710703/photo/abstract-green-leaf-texture-nature-background-tropical-leaf.jpg?s=612x612&w=0&k=20&c=9lx0Lkt-N69bSjLqCji9bq2B_zfvRy7FGeh2Ldlv9ek=",
                ),
              ),
            ),
          ),
          Positioned(
            top:250,
            bottom:100,
            left: 15,
            right: 15,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The best",
                    style:TextStyle (
                      fontSize: 70,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "app for",
                    style: TextStyle(
                      fontSize: 70,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "your plants.",
                    style: TextStyle(
                      fontSize: 70,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 60),
                  Column(
                    children: [
                      MaterialButton(
                        onPressed: () {
                           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                        },
                        color: Colors.white,
                        minWidth: 500,
                        shape: const StadiumBorder(),
                        height: 65,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      MaterialButton(
                        onPressed: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  LoginScreen(),
                          ),
                        );
                        },
                        color: Color.fromARGB(255, 44, 126, 86),
                        minWidth: 500,
                        shape: const StadiumBorder(),
                        height: 65,
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

