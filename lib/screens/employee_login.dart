import 'dart:convert';
import 'package:dapp/admin/adminpage.dart';
import 'package:dapp/forgotpassword/forgotpassword_email.dart';
import 'package:dapp/screens/welcome_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dapp/Customer/customer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeLogin extends StatefulWidget {
  const EmployeeLogin({Key? key, required String email}) : super(key: key);

  @override
  State<EmployeeLogin> createState() => _EmployeeLoginState();
}

class _EmployeeLoginState extends State<EmployeeLogin> {
  final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberPassword = true;
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.JPG'), // Change the path to your image file
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 40.0,
              left: 10.0,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ),
          );
                },
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            Column(
              children: [
                const Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                Expanded(
                  flex: 7,
              child: Container(
                padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formSignInKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Employee Login',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.red[300],
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          controller: _emailController,
                          maxLength: 35,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9,!#$%&'*+-/=?^_`{|~}]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text('Email'),
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          // Use the state variable to determine if the password is visible or hidden
                          obscureText: !passToggle,
                          obscuringCharacter: '*',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            } else if (value.length > 20) {
                              return 'Password must be less than 20 characters';
                            } else if (value.contains(' ')) {
                              return 'Password cannot contain spaces';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // Add a lock icon as a prefix icon
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                              color: Color.fromARGB(255, 65, 63, 63),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },
                              icon: Icon(
                                !passToggle ? Icons.visibility_off : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to the password reset screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Forgotpassword_Email(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formSignInKey.currentState!.validate() && rememberPassword) {
                                await _loginUser();
                              } else if (!rememberPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please agree to the processing of personal data'),
                                  ),
                                );
                              }
                            },
                            child: const Text('Login'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[300],
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
          ],
      ),
      ),
    );
  }

Future<void> _loginUser() async {
  String email = _emailController.text.trim();
  String password = _passwordController.text.trim();
  try {
    http.Response response = await http.post(
      Uri.parse("http://13.201.213.5:4040/emp/employeelogin"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'userEmail': email, 'userPassword': password}),
    );

    var res = json.decode(response.body);
    print(res);

    if (res['status'] == true) {
      var userData = res['body'];

      // Navigate to admin page if the user is an admin
      if (userData['adminStatus']) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdminPage(),
          ),
        );
      } else {
        // Navigate to customer page for other users
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerPage(),
          ),
        );
      }

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully logged in'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // Show error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res['message'] ?? 'An error occurred'),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (e) {
    // Show error SnackBar if an exception occurs
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An error occurred: $e'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
}
                                Employee login page
