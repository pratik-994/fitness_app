import 'package:fitness_app/repository/user_repository.dart';
import 'package:fitness_app/screens/bottomNavBar.dart';
import 'package:fitness_app/widgets/text_form_field_input.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  // late StreamSubscription<dynamic> _streamSubscription;
  final _usernameEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  // bool? _isNear;

  // Future<void> listenSensor() async {
  //   FlutterError.onError = (FlutterErrorDetails details) {
  //     if (foundation.kDebugMode) {
  //       FlutterError.dumpErrorToConsole(details);
  //     }
  //   };
  //   _streamSubscription = ProximitySensor.events.listen((int event) {
  //     setState(() {
  //       _isNear = (event > 0) ? true : false;
  //     });
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   listenSensor();
  // }

  @override
  void dispose() {
    super.dispose();
    _usernameEditingController.dispose();
    _passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return
        // _isNear!
        // ? const Scaffold(
        //     backgroundColor: Colors.black,
        //   )
        // :
        Scaffold(
      // backgroundColor: const Color.fromRGBO(250, 250, 255, 1),
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      // (255, 240, 247, 255), (255, 245, 250, 255)

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Flexible(child: Container(), flex: 1),
                  // SizedBox(heig),

                  // logo of the application
                  SizedBox(
                    height: 300,
                    width: 200,
                    child: Image.network("https://i.pinimg.com/originals/58/b8/01/58b801823c2ee845a6fa3e749dbe3d83.png"),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  

                  // Textformfield for username
                  TextFormFieldInput(
                    key: const ValueKey("txtUsername"),
                    textEditingController: _usernameEditingController,
                    hintText: "UserName",
                    prefixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // Textformfield for password
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

                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                  // Forgotpassword button
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(11, 86, 222, 5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                  // Login button
                  InkWell(
                    onTap: () {
                      if (_globalKey.currentState!.validate()) {
                        _login();
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
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  // flexible for space
                  // Flexible(child: Container(), flex: 2),'

                  // Row for signup part
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text("Do you have an Account? "),
                      ),

                      // SignUp button
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text(
                            "Sign Up",
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

  _login() async {
    UserRepository userRepository = UserRepository();
      bool isLogin = await userRepository.loginUser(
        _usernameEditingController.text,
        _passwordEditingController.text,
      );
      _navitageToPatientScreen(isLogin);

  }

  _navitageToPatientScreen(bool isLogin) {
    if (isLogin == true) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const BottomNavBar(index: 0)),
      );
    } else {
      MotionToast.error(
              description: const Text("Invalid Patient Credentials.."))
          .show(context);
    }
  }

  
}