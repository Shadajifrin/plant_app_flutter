import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:plant_app_flutter/screens/register.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formkey = GlobalKey<FormState>();
  var pas_visibility = true;
  String email = "admin@email.com";
  String password = "123456";
  var emailcontroller = TextEditingController();
  var pascontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            child: Icon(Icons.arrow_back_ios_new,color: Color.fromARGB(255, 44, 126, 86),),
                backgroundColor: Color.fromARGB(255, 220, 244, 220)),
        )
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 44, 126, 86),
                      ),
                    ),
                    Text(
                      "Login to your Account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 220, 244, 220),
                        prefixIcon: Icon(Icons.person_2_rounded,
                            color: Color.fromARGB(255, 44, 126, 86)),
                        hintText: "Full Name",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 44, 126, 86)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the value as needed
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: pascontroller,
                      obscureText: pas_visibility,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 220, 244, 220),
                        prefixIcon: Icon(Icons.lock_rounded,
                            color: Color.fromARGB(255, 44, 126, 86)),
                            
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              pas_visibility = !pas_visibility;
                            });
                          },
                          icon: Icon(
                            pas_visibility
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 44, 126, 86)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the value as needed
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                       Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 5),
                      Text("Remind me", style: TextStyle(color: Colors.grey)),
                      Spacer(),
                      Text("Forgot Password?", style: TextStyle(color:Color.fromARGB(255, 44, 126, 86) )),
                    ],
                  ),
                    // ElevatedButton(onPressed: (){}, child: Text("Login"),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),),
                    const SizedBox(height: 30),
                    MaterialButton(
                      onPressed: () {
                        if (email == emailcontroller.text &&
                            password == pascontroller.text) {
                          successSnackBar(context) =>
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Login Success!"),
                                backgroundColor: Colors.green,
                              ));
                        } else {
                          errorSnackbar(context) =>
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Login failed!"),
                                backgroundColor: Colors.red,
                              ));
                        }
                        emailcontroller.clear();
                        pascontroller.clear();
                      },
                      color: Color.fromARGB(255, 44, 126, 86),
                      minWidth: 500,
                      shape: const StadiumBorder(),
                      height: 65,
                      child: const Text("Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white)),
                    ),
SizedBox(height: 10,),
                    RichText(
                        text: TextSpan(text: "Not a user?" ,style: TextStyle(color: Colors.grey), children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                            },
                          text: "Sign Up",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,color:Color.fromARGB(255, 44, 126, 86) , fontSize: 18))
                    ])),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
