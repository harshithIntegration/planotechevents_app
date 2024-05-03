import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:planotechevents/screens/customer_login.dart';
import 'package:planotechevents/screens/signup_screen.dart';
import 'package:planotechevents/screens/signup_service.dart';

class OTPController {
  bool validateOTP(String otp) {
    return otp.length == 4;
  }
}

// ignore: must_be_immutable
class EmailVerifyOTP extends StatefulWidget {
  Signup_Service service = Signup_Service();
  // EmailVerifyOTP(String e);
    // String semail = service.getMail();
   String email="";
  
  EmailVerifyOTP({required this.email});

  @override
  _EmailVerifyOTPState createState() => _EmailVerifyOTPState(email: email);
}
    // Signup_Service service = Signup_Service();
    // String semail = service.getMail();

class _EmailVerifyOTPState extends State<EmailVerifyOTP> {
  final TextEditingController _otpController = TextEditingController();
  final OTPController otpController = OTPController();
  bool isResendBlinking = false;
  bool isResendButtonEnabled = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _responseMessage = '';
  final String email;
  
  _EmailVerifyOTPState({required this.email});

  Future<void> _verifyOTP() async {
    final String otp = _otpController.text;

    final Uri url = Uri.parse('http://13.201.213.5:4040/pte/signupotpverification');
    // final Uri url = Uri.parse('');
    // print(semail);
    var b=json.encode({'userEmail': email, 'userOtp': otp});
    print("-------");
    print(b);
    print('$email');
    print('$otp');
    try {
      final http.Response response = await http.post(
        url,
        body: b,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("--------");
      print(response.body);
      // mmm();

      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        if (responseBody['statusMessage'] == 'pass') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Customer_login(email: email),
            ),
          );
        } else {
          setState(() {
            _responseMessage = responseBody['message'] ?? '';
          });
        }
      } else {
        setState(() {
          _responseMessage = 'An error occurred, please try again later';
        });
      }
    } catch (error) {
      setState(() {
        _responseMessage = 'An error occurred, please try again later';
      });
    }
  }

  void startResendTimer() {
    Timer(const Duration(seconds: 30), () {
      setState(() {
        isResendButtonEnabled = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm OTP'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ),
            );
          },
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.red[300],
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter OTP',
                    hintText: 'Enter your valid OTP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  maxLength: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter OTP';
                    }
                    return null;
                  },
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate() &&
                        isResendButtonEnabled) {
                      setState(() {
                        isResendBlinking = true;
                        isResendButtonEnabled = false;
                      });
                      print('Sending request with email...');
                      startResendTimer();
                      Timer(const Duration(milliseconds: 300), () {
                        setState(() {
                          isResendBlinking = false;
                        });
                      });
                    }
                  },
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      color: isResendBlinking ? Colors.transparent : Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    child: const Text('  Resend OTP'),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _verifyOTP,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(255, 241, 137, 130),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  child: const Text('Verify OTP'),
                ),
                const SizedBox(height: 10.0),
                if (_responseMessage.isNotEmpty)
                  Text(
                    _responseMessage,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
