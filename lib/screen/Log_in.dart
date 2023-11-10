import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:re_pr2_aryan_1336/helper/auth_helper.dart';
import 'package:re_pr2_aryan_1336/utils/myroutes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  GlobalKey<FormState> SingInKey = GlobalKey<FormState>();

  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(149, 171, 71, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    TextButton(
                        onPressed: () {}, child: Text("Forgot Password?"))
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (SingInKey.currentState!.validate()) {
                        Future<dynamic> user = AuthHelper.authHelper
                            .signInWithEmailAndPassword(
                                emailAddress: Emailcontroller.text,
                                password: Passwordcontroller.text);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            MyRoutes.HomePage, (route) => false,
                            arguments: user);

                        Emailcontroller.clear();
                        Passwordcontroller.clear();
                      } else {}
                    },
                    child: Text("Sing IN")),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: const Divider()),
                  IconButton(
                    onPressed: () async {
                      GoogleSignInAccount User1 =
                          await AuthHelper.authHelper.googleSignIn();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          MyRoutes.HomePage, (route) => false,
                          arguments: User1);
                    },
                    icon: Image.network(
                      "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                      height: 50,
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        AuthHelper.authHelper.signInAnonymously();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          MyRoutes.HomePage,
                          (route) => false,
                        );
                      },
                      icon: Icon(
                        Icons.person,
                        size: 40,
                      )),
                  Expanded(child: const Divider()),
                ],
              ),
              Hero(
                tag: 'add',
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(MyRoutes.SingInPage);
                    },
                    child: Text("Create a new account ?",
                        style: TextStyle(color: Colors.grey.shade500)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
