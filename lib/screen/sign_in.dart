import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:re_pr2_aryan_1336/helper/auth_helper.dart';
import 'package:re_pr2_aryan_1336/utils/myroutes.dart';

class SingInPage extends StatelessWidget {
  SingInPage({super.key});

  GlobalKey<FormState> SingInKey = GlobalKey<FormState>();

  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  TextEditingController conformPasswordcontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(149, 171, 71, 1),
        leading: Hero(
          tag: 'add',
          transitionOnUserGestures: true,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.network(
                  "https://img.freepik.com/premium-vector/person-with-todo-list-planning-organizing-work-man-analyzing-checking-controlling-business-tasks-workflow-management-concept-flat-vector-illustration-isolated-white-background_633472-503.jpg"),
              Form(
                key: SingInKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      child: TextFormField(
                        controller: Emailcontroller,
                        validator: (value) {
                          if (value == null) {
                            return "Please Enter Email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          focusColor: Color.fromRGBO(149, 171, 71, 1),
                          labelText: "Email",
                          hintStyle:
                              TextStyle(color: Color.fromRGBO(149, 171, 71, 1)),
                          prefixIcon: Icon(Icons.email_outlined),
                          prefixIconColor: Color.fromRGBO(149, 171, 71, 1),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        controller: Passwordcontroller,
                        validator: (value) {
                          if (value == null) {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          focusColor: Color.fromRGBO(149, 171, 71, 1),
                          labelText: "Password",
                          hintStyle:
                              TextStyle(color: Color.fromRGBO(149, 171, 71, 1)),
                          prefixIcon: Icon(Icons.password),
                          prefixIconColor: Color.fromRGBO(149, 171, 71, 1),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        controller: conformPasswordcontroller,
                        validator: (value) {
                          if (value == null) {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          focusColor: Color.fromRGBO(149, 171, 71, 1),
                          labelText: "Conform Password",
                          hintStyle:
                              TextStyle(color: Color.fromRGBO(149, 171, 71, 1)),
                          prefixIcon: Icon(Icons.password),
                          prefixIconColor: Color.fromRGBO(149, 171, 71, 1),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: () {
                            print(
                                "111111111111111111111111111111111111111111111111111111111111");
                            if (SingInKey.currentState!.validate()) {
                              print(
                                  "000000000000000000000000000000000000000000000000000000000");
                              final SingIn = AuthHelper.authHelper
                                  .createUserWithEmailAndPassword(
                                      emailAddress: Emailcontroller.text,
                                      password: (Passwordcontroller.text ==
                                              conformPasswordcontroller.text)
                                          ? Passwordcontroller.text
                                          : "");
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  MyRoutes.HomePage, (route) => true,
                                  arguments: SingIn);
                              Emailcontroller.clear();
                              conformPasswordcontroller.clear();
                              Passwordcontroller.clear();
                            } else {
                              Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                          child: Text("Sign IN")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
