// import 'package:dapp/screens/customer_login.dart';
// import 'package:dapp/screens/employee_login.dart';
// import 'package:dapp/widgets/custom_scaffold.dart';
// import 'package:dapp/widgets/welcome_button.dart';
// import 'package:flutter/material.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       child: Column(
//         children: [
//           Flexible(
//               flex: 8,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 0,
//                   horizontal: 40.0,
//                 ),
//                 child: Center(
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: const TextSpan(
//                       children: [
//                         TextSpan(
//                             text: 'Hello...!\n',
//                             style: TextStyle(
//                               fontSize: 40.0,
//                               fontWeight: FontWeight.bold,

//                             )),
//                         TextSpan(
//                             text:
//                                 '\nWelcome to our Planotech Events And Marketing',
//                             style: TextStyle(
//                               fontSize: 30,
//                               // height: 0,
//                             ))
//                       ],
//                     ),
//                   ),
//                 ),
//               )),
//           Flexible(
//             // flex: 1,
//             child: Align(
//               alignment: Alignment.bottomRight,
//               child: Row(
//                 children: [
//                   const Expanded(
//                     child: WelcomeButton(
//                       buttonText: 'Employee login',
//                       onTap: EmployeeLogin(),
//                       color: Colors.transparent,
//                       textColor: Colors.white,
//                     ),
//                   ),
//                   Expanded(
//                     child: WelcomeButton(
//                       buttonText:'Customer_login',
//                       onTap: const Customer_login(),
//                       color: Colors.white,
//                       textColor: Colors.red[300],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:planotechevents/dashboard.dart';
import 'package:planotechevents/screens/customer_login.dart';
import 'package:planotechevents/screens/employee_login.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Welcome'),
        // ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background.JPG'), // Change the path to your image file
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(children: [
              Positioned(
                top: 40.0,
                left: 10.0,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              Column(children: [
                const Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 40.0,
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Welcome to our Planotech Events And Marketing!\n',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    // text: '\nWelcome to our Planotech Events And Marketing',
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EmployeeLogin()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical:
                                            15), // Adjust the padding as needed
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(color: Colors.white),
                                    ),
                                    backgroundColor: Colors
                                        .transparent, // Transparent background
                                    foregroundColor: Colors.white, // Text color
                                  ),
                                  child: const Text(
                                    'Employee Login',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Customer_login()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical:
                                            15), // Adjust the padding as needed
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            35), // Adjust the radius as needed
                                        // bottomLeft: Radius.circular(30), // Adjust the radius as needed
                                      ),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              255, 134, 182, 190)),
                                    ),
                                    backgroundColor:
                                        Colors.white, // Red background
                                    foregroundColor:
                                        Colors.red[300], // Text color
                                  ),
                                  child: const Text(
                                    'Customer Login',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ])
            ])));
  }
}
