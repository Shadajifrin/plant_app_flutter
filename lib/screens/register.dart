import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plant_app_flutter/screens/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool cnfmVisibility = true;
  bool pasVisibility = true;

  void warningSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fix the errors.'),
      ),
    );
  }

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
              key: formKey,
              
              child: Positioned(
                top: 120,
                bottom: 50,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    SizedBox(height: 35,),
                    const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 44, 126, 86),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Create your new account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 45),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 220, 244, 220),
                        prefixIcon: Icon(Icons.person_2_rounded, color: Color.fromARGB(255, 44, 126, 86)),
                        hintText: "Full Name",
                        hintStyle: TextStyle(color: Color.fromARGB(255, 44, 126, 86)),
                      border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
      borderSide: BorderSide.none,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:Color.fromARGB(255, 220, 244, 220),
                        prefixIcon: Icon(Icons.email_rounded, color: Color.fromARGB(255, 44, 126, 86)),
                        hintText: "jhonsmith@gmail.com",
                        hintStyle: TextStyle(color: Color.fromARGB(255, 44, 126, 86)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passController,
                      obscureText: pasVisibility,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 220, 244, 220),
                        prefixIcon: Icon(Icons.lock_rounded, color:Color.fromARGB(255, 44, 126, 86)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              pasVisibility = !pasVisibility;
                            });
                          },
                          icon: Icon(
                            pasVisibility ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color:Color.fromARGB(255, 44, 126, 86)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
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
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: cnfmVisibility,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 220, 244, 220),
                        prefixIcon: Icon(Icons.lock_rounded, color: Color.fromARGB(255, 44, 126, 86)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              cnfmVisibility = !cnfmVisibility;
                            });
                          },
                          icon: Icon(
                            cnfmVisibility ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(color: Color.fromARGB(255, 44, 126, 86)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value != passController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  SizedBox(height: 10,),
                    Column(
                      children: [
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(color: Colors.black,fontSize: 15,),
                              children: [
                                TextSpan(
                                  text: 'By signing you agree to our ',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 44, 126, 86)),
                                ),
                                TextSpan(
                                  text: 'Team of use',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                ),
                                
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(fontWeight: FontWeight.bold, color:Color.fromARGB(255, 44, 126, 86)),
                                ),
                                TextSpan(
                                  text: 'Privacy Notice',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                ),
                          ],
                                        ),
                                      ),
                        
                        SizedBox(height: 280,),
                        MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  LoginPage(),
                                ),
                              );
                            } else {
                              warningSnackbar(context);
                            }
                          },
                          color: Color.fromARGB(255, 25, 65, 26),
                          minWidth: 500,
                          shape: const StadiumBorder(),
                          height: 65,
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                           RichText(
                            text: const TextSpan(
                              style: TextStyle(color: Colors.black,fontSize: 15,),
                              children: [
                                TextSpan(
                                  text: 'Dont have an account?',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                ),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 44, 126, 86)),
                                ),
                              ],
                              ),  
                        ),
                                        
                      ],
                    ),
                  ],
                          ),
              ),
        ),
      ),
    ),
      ),
    );
  }
}
