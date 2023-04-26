import 'package:fitness_app/models/userModel.dart';
import 'package:fitness_app/repository/user_repository.dart';
import 'package:fitness_app/utils/show_message.dart';
import 'package:fitness_app/widgets/text_form_field_input.dart';
import 'package:flutter/material.dart';

class RegisterPageScreen extends StatefulWidget {
  const RegisterPageScreen({Key? key}) : super(key: key);

  @override
  State<RegisterPageScreen> createState() => _RegisterPageScreenState();
}

class _RegisterPageScreenState extends State<RegisterPageScreen> {
  final _fnameEditingController = TextEditingController();
  final _lnameEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _usernameEditingController = TextEditingController();
  final _addressEditingController = TextEditingController();
  final _phoneEditingController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Flexible(child: Container(), flex: 1),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 50,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color.fromRGBO(11, 86, 222, 5),
                          // border:
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 300,
                    width: 200,
                    child: Image.network("https://i.pinimg.com/originals/58/b8/01/58b801823c2ee845a6fa3e749dbe3d83.png"),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // text form field for firstname
                  TextFormFieldInput(
                    textEditingController: _fnameEditingController,
                    hintText: "Fullname",
                    prefixIcon: const Icon(
                      Icons.access_alarm,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // textformfield for email
                  TextFormFieldInput(
                    key: const ValueKey("txtEmail"),
                    textEditingController: _emailEditingController,
                    hintText: "Email",
                    prefixIcon: const Icon(
                      Icons.access_alarm,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // textformfield for password
                  TextFormFieldInput(
                    key: const ValueKey("txtPassword"),
                    textEditingController: _passwordEditingController,
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.access_alarm,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                    isPass: true,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // SignUp button
                  InkWell(
                    key: const ValueKey("btnSignup"),
                    onTap: () {
                      if (_globalKey.currentState!.validate()) {
                        UserModel user = UserModel(
                          fullName: _fnameEditingController.text,
                          email: _emailEditingController.text,
                          password: _passwordEditingController.text,
                        );
                        _registerUser(user);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                        color: Color.fromRGBO(11, 86, 222, 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                      child: const Text(
                        "SignUp",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text("Already an Account? "),
                      ),

                      // SignUp button
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(11, 86, 222, 5)),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _registerUser(UserModel user) async {
    bool isSignUp = await UserRepository().registerUser(user);
    _displayMessage(isSignUp);
  }

  _displayMessage(bool isSignUp) {
    if (isSignUp) {
      Navigator.pushNamed(context, '/login');
      displaySuccessMessage(context, "register success");
    } else {
      displayErrorMessage(context, "register Failed");
    }
  }
}
