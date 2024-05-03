import 'dart:async';
import 'package:flutter/material.dart';
import 'package:planotechevents/screens/forget_passsword_screen.dart';
import 'package:planotechevents/screens/newpassword.dart';

class OTPController {
  bool validateOTP(String otp) {
    return otp.length == 4;
  }
}

class ConfirmOtp extends StatefulWidget {
  @override
  _ConfirmOtpState createState() => _ConfirmOtpState();
}

class _ConfirmOtpState extends State<ConfirmOtp> {
  final TextEditingController _otpController = TextEditingController();
  final OTPController otpController = OTPController();
  bool isResendBlinking = false;
  bool isResendButtonEnabled = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    startResendTimer();
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Confirm OTP'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResetPasswordPage(),
                ),
              );
            },
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 64, 144, 209),
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
                        color:
                            isResendBlinking ? Colors.transparent : const Color.fromARGB(255, 64, 144, 209),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      child: const Text('  Resend OTP'),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewPasswordPage(),
                          ),
                        );
                      }
                    },
                    child: const Text('Verify OTP'),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        const Color.fromARGB(255, 248, 248, 248),
                      ),
                      foregroundColor: WidgetStateProperty.all<Color>(
                        const Color.fromARGB(255, 64, 144, 209),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
