// ignore_for_file: camel_case_types, file_names, prefer_const_constructors

import 'package:bloodforlife/Screens/bottombar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../SignIn/sign_in.dart';
import 'Model/user_model.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    //--------------------------------full Name
    final fullnamefeild = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: fullnameController,
      onSaved: (value) {
        fullnameController.text = value!;
      },
      validator: (value) {
        RegExp regex = RegExp(r'^.{13,}$');
        if (value!.isEmpty) {
          return ("Please Enter full Name");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Name");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.indeterminate_check_box_rounded),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Your CNIC",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
    //--------------------------------user Name
    final usernamefeild = TextFormField(
      autofocus: false,
      controller: usernameController,
      onSaved: (value) {
        usernameController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter user Name");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "user Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
    //--------------------------------Email
    final emailfeild = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Email");
        }
        String pattern = r'\w+@\w+\.\w+';
        if (!RegExp(pattern).hasMatch(value)) {
          return 'Invalid Email format';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "E mail",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
    //--------------------------------Password
    final passwordfeild = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      onSaved: (value) {
        passwordController.text = value!;
      },
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter Password");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password(Min 6 character)");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
    //--------------------------------Confirm Password
    final confirmpassword = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: confirmpasswordController,
      onSaved: (value) {
        confirmpasswordController.text = value!;
      },
      validator: (value) {
        if (confirmpasswordController.text != passwordController.text) {
          return "Password dont Match";
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
    //--------------------------------Button
    final loginbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.purple,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailController.text, passwordController.text);
        },
        child: const Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // SizedBox(
                    //     height: 200,
                    //     child: Image.asset(
                    //       "assets/logo.png",
                    //       width: 220,
                    //     )),
                    fullnamefeild,
                    const SizedBox(
                      height: 20,
                    ),
                    usernamefeild,
                    const SizedBox(
                      height: 20,
                    ),
                    emailfeild,
                    const SizedBox(
                      height: 20,
                    ),
                    passwordfeild,
                    const SizedBox(
                      height: 20,
                    ),
                    confirmpassword,
                    const SizedBox(
                      height: 30,
                    ),
                    loginbutton,
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        GestureDetector(
                          onTap: () => Get.to(
                            Sign_In(),
                          ),
                          child: const Text(
                            " Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((uid) => {postDetailsToFirebase()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  //postDetailsToFirebase
  postDetailsToFirebase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullName = fullnameController.text;
    userModel.userName = usernameController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.tomap());
    Fluttertoast.showToast(
      msg: "Account created successfully :)",
    );
    Get.to(() => Sign_In());
  }
}
