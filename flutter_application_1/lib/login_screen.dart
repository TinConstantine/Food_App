import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/product.dart';
import 'type_screen.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:email_validator/email_validator.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/login_image.jpg"),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Flexible(child: SizedBox()),
          Flexible(
              child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ));
                  },
                  style: const ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(320, 55)),
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ));
                  },
                  style: const ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(320, 55)),
                      backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                  child: const Text(
                    "Register now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    ));
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
        backgroundColor: Colors.grey,
      ),
      body: const BodyLogin(),
    );
  }
}

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Register"),
        backgroundColor: Colors.grey,
      ),
      body: const BodyRegister(),
    );
  }
}

class BodyRegister extends StatefulWidget {
  const BodyRegister({super.key});

  @override
  State<BodyRegister> createState() => _BodyRegisterState();
}

List<String> gender = ["Male", "Female"];

class _BodyRegisterState extends State<BodyRegister> {
  final controllerName = TextEditingController();
  final controllerUserName = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerPassword2 = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  final controllerAddress = TextEditingController();
  bool _passBool = false;
  bool _numBool = false;
  bool _emailBool = false;

  String currentGender = gender[0];

  bool checkNull() {
    if (controllerAddress.text.isEmpty ||
        controllerEmail.text.isEmpty ||
        controllerName.text.isEmpty ||
        controllerPassword.text.isEmpty ||
        controllerPhoneNumber.text.isEmpty ||
        controllerUserName.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.only(top: 30)),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: TextField(
              controller: controllerName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Enter your name"),
            ),
          )),
          // Flexible(
          //     child: Padding(
          //         padding:
          //             const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          //         child: ListTile(
          //           title: const Text("Male"),
          //           leading: Radio(
          //               value: gender[0],
          //               groupValue: currentGender,
          //               onChanged: (value) {
          //                 setState(() {
          //                   currentGender = value.toString();
          //                 });
          //               }),
          //         ))),
          // Flexible(
          //     child: Padding(
          //         padding:
          //             const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          //         child: ListTile(
          //           title: const Text("Female"),
          //           leading: Radio(
          //               value: gender[1],
          //               groupValue: currentGender,
          //               onChanged: (value) {
          //                 setState(() {
          //                   currentGender = value.toString();
          //                 });
          //               }),
          //         ))),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: TextField(
              controller: controllerUserName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Enter your username"),
            ),
          )),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: TextField(
              obscureText: true,
              controller: controllerPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Enter your password"),
            ),
          )),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: TextField(
              obscureText: true,
              controller: controllerPassword2,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Re-enter password"),
              onChanged: (text) {
                setState(() {
                  if (text != controllerPassword.text) {
                    _passBool = true;
                  } else {
                    _passBool = false;
                  }
                });
              },
            ),
          )),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Visibility(
              visible: _passBool,
              child: const Text(
                "Password does not match",
                style: TextStyle(color: Colors.red),
              ),
            ),
          )),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: TextField(
              controller: controllerEmail,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Enter your email"),
              onChanged: (text) {
                setState(() {
                  if (EmailValidator.validate(text)) {
                    _emailBool = false;
                  } else {
                    _emailBool = true;
                  }
                });
              },
            ),
          )),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Visibility(
              visible: _emailBool,
              child: const Text(
                "Invalid email",
                style: TextStyle(color: Colors.red),
              ),
            ),
          )),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                FilteringTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              controller: controllerPhoneNumber,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Enter your phone number"),
              onChanged: (text) {
                setState(() {
                  if (text.length < 10) {
                    _numBool = true;
                  } else {
                    _numBool = false;
                  }
                });
              },
            ),
          )),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Visibility(
              visible: _numBool,
              child: const Text(
                "Invalid phone numbe",
                style: TextStyle(color: Colors.red),
              ),
            ),
          )),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: TextField(
              controller: controllerAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Enter your address"),
            ),
          )),
          Row(
            children: [
              Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(Size(20, 45)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey)),
                        onPressed: () {
                          controllerAddress.clear();
                          controllerEmail.clear();
                          controllerName.clear();
                          controllerPassword.clear();
                          controllerPhoneNumber.clear();
                          controllerUserName.clear();
                          controllerPassword2.clear();
                          setState(() {
                            _emailBool = false;
                            _numBool = false;
                            _passBool = false;
                          });
                        },
                        child: const Text("Reset")),
                  )),
              Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(Size(20, 45)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey)),
                        onPressed: () async {
                          if (checkNull()) {
                            if (_emailBool || _numBool || _passBool) {
                              showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.info(
                                  message: "Please check the information again",
                                ),
                              );
                            } else {
                              Map<String, String> params = {};
                              params["fullName"] = controllerName.text;
                              params["userName"] = controllerUserName.text;
                              params["password"] = controllerPassword.text;
                              params["gender"] = "Male";
                              params["email"] = controllerEmail.text;
                              params["phoneNumber"] =
                                  controllerPhoneNumber.text;
                              params["address"] = controllerAddress.text;
                              String res = await register(
                                  http.Client(), params, context);
                              if (res.isEmpty) {
                                showTopSnackBar(
                                  // ignore: use_build_context_synchronously
                                  Overlay.of(context),
                                  const CustomSnackBar.info(
                                    message: "Register successfully",
                                  ),
                                );
                              } else {
                                showTopSnackBar(
                                    // ignore: use_build_context_synchronously
                                    Overlay.of(context),
                                    CustomSnackBar.info(
                                      message: res,
                                    ));
                              }
                            }
                          } else {
                            showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.info(
                                message: "Please enter full information",
                              ),
                            );
                          }
                        },
                        child: const Text("Register")),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class BodyLogin extends StatefulWidget {
  const BodyLogin({super.key});

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  final controllerUserName = TextEditingController();
  final controllerPassWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 30)),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: TextField(
            controller: controllerUserName,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Enter your username"),
          ),
        )),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: TextField(
            obscureText: true,
            controller: controllerPassWord,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Enter your password"),
          ),
        )),
        Flexible(
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.grey),
                        minimumSize: MaterialStatePropertyAll(Size(200, 45))),
                    onPressed: () async {
                      if (controllerPassWord.text.isEmpty ||
                          controllerUserName.text.isEmpty) {
                        const snackBar = SnackBar(
                          content: Text("Please enter full information"),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        Map<String, String> params = {};
                        params["userName"] = controllerUserName.text;
                        params["password"] = controllerPassWord.text;
                        String res =
                            await login(http.Client(), params, context);
                        if (res.isNotEmpty) {
                          // final snackBar = SnackBar(
                          //   content: Text(res),
                          //   duration: const Duration(seconds: 2),
                          // );
                          // // ignore: use_build_context_synchronously
                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          showTopSnackBar(
                            // ignore: use_build_context_synchronously
                            Overlay.of(context),
                            CustomSnackBar.info(
                              message: res,
                            ),
                          );
                        }
                      }
                    },
                    child: const Text("Login"))))
      ],
    );
  }
}
