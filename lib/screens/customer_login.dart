// import 'dart:convert';
// import 'package:dapp/admin/adminpage.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:dapp/Customer/customer.dart';
// import 'package:dapp/screens/signup_screen.dart';
// import 'package:dapp/widgets/custom_scaffold.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Customer_login extends StatefulWidget {
//   const Customer_login({Key? key}) : super(key: key);

//   @override
//   State<Customer_login> createState() => _Customer_loginState();
// }

// class _Customer_loginState extends State<Customer_login> {
//   final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool rememberPassword = true;
//   bool passToggle = true;

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       child: Column(
//         children: [
//           const Expanded(
//             flex: 1,
//             child: SizedBox(
//               height: 10,
//             ),
//           ),
//           Expanded(
//             flex: 7,
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40.0),
//                   topRight: Radius.circular(40.0),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formSignInKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Welcome back',
//                         style: TextStyle(
//                           fontSize: 30.0,
//                           fontWeight: FontWeight.w900,
//                           color: Colors.red[300],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40.0,
//                       ),
//                       TextFormField(
//                         controller: _emailController,
//                           maxLength: 35,

//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           } else if (!RegExp(
//                               r"^[a-zA-Z0-9.a-zA-Z0-9,!#$%&'*+-/=?^_`{|~}]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                               .hasMatch(value)) {
//                             return 'Please enter a valid email';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           label: const Text('Email'),
//                           hintText: 'Enter your email',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       TextFormField(
//   controller: _passwordController,
//   // Use the state variable to determine if the password is visible or hidden
//   obscureText: !passToggle,
//   obscuringCharacter: '*',
//   validator: (value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your password';
//     } else if (value.length < 6) {
//       return 'Password must be at least 6 characters';
//     } else if (value.length > 20) {
//       return 'Password must be less than 20 characters';
//     } else if (value.contains(' ')) {
//       return 'Password cannot contain spaces';
//     }
//     return null;
//   },
//   decoration: InputDecoration(
//     label: const Text('Password'),
//     hintText: 'Enter your password',
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//     // Add a lock icon as a prefix icon
//     prefixIcon: Icon(
//       Icons.lock_outlined,
//       color: Color.fromARGB(255, 65, 63, 63),
//     ),

//     suffixIcon: IconButton(
//       onPressed: () {
//         setState(() {
//           passToggle = !passToggle;
//         });
//       },
//       icon: Icon(
//         !passToggle ? Icons.visibility_off: Icons.visibility,
//       ),
//     ),
//   ),
// ),

//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                        const Text(
//                                 'Forgot password?',
//                                 style: TextStyle(
//                                   color: Colors.red,
//                                 ),
//                               ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             if (_formSignInKey.currentState!.validate() &&
//                                 rememberPassword) {
//                               await _loginUser();
//                             } else if (!rememberPassword) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text(
//                                       'Please agree to the processing of personal data'),
//                                 ),
//                               );
//                             }
//                           },
//                           child: const Text('Login'),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red[300],
//                             foregroundColor: Colors.white,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 35.0,
//                       ),
//                       // don't have an account
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             'Don\'t have an account? ',
//                             style: TextStyle(
//                               color: Colors.black,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const SignUpScreen(),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               '  Sign up',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.red[300],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _loginUser() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();

//     try {
//       http.Response response = await http.post(
//         Uri.parse("http://3.6.109.119:4040/qp/login"),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode({'userEmail': email, 'userPassword': password}),
//       );

//       var res = json.decode(response.body);
//       bool status = res['status'];

//       if (status) {
//         bool userStatus = res['body']['userStatus'];

//         if (userStatus) {
//           // Navigate to admin page
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AdminPage(),
//             ),
//           );
//         } else {
//           // Navigate to customer page
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           await prefs.setString('email', email);
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CustomerPage(),
//             ),
//           );
//         }
//       } else {
//         String error = res['message'];
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Row(
//               children: [
//                 Icon(Icons.error, color: Colors.white),
//                 SizedBox(width: 10),
//                 Text(
//                   error,
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }

import 'dart:convert';
import 'package:planotechevents/admin/adminpage.dart';
import 'package:planotechevents/screens/forget_passsword_screen.dart';
import 'package:planotechevents/screens/welcome_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:planotechevents/Customer/customer.dart';
import 'package:planotechevents/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customer_login extends StatefulWidget {
  const Customer_login({Key? key}) : super(key: key);

  @override
  State<Customer_login> createState() => _Customer_loginState();
}

class _Customer_loginState extends State<Customer_login> {
  final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberPassword = true;
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background.JPG'), // Change the path to your image file
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
                      builder: (context) => const WelcomeScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                              'Welcome back',
                              style: TextStyle(
                                fontSize: 30.0,
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
                                prefixIcon: const Icon(
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
                                    !passToggle
                                        ? Icons.visibility_off
                                        : Icons.visibility,
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
                                    builder: (context) =>
                                        const ResetPasswordPage(),
                                  ),
                                );
                              },
                              child: const Text(
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
                                  if (_formSignInKey.currentState!.validate() &&
                                      rememberPassword) {
                                    await _loginUser();
                                  } else if (!rememberPassword) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please agree to the processing of personal data'),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[300],
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Login'),
                              ),
                            ),
                            const SizedBox(
                              height: 35.0,
                            ),
                            // don't have an account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have an account? ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '  Sign up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red[300],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
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
        Uri.parse("http://3.6.109.119:4040/qp/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'userEmail': email, 'userPassword': password}),
      );

      var res = json.decode(response.body);
      bool status = res['status'];

      if (status) {
        bool userStatus = res['body']['userStatus'];

        if (userStatus) {
          // Navigate to admin page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AdminPage(),
            ),
          );
        } else {
          // Navigate to customer page
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('email', email);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CustomerPage(),
            ),
          );
        }
      } else {
        String error = res['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  error,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
