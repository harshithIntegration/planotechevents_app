import 'package:flutter/material.dart';
import 'package:planotechevents/dashboard.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  bool isSubmitEnabled = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(checkSubmitButton);
    emailController.addListener(checkSubmitButton);
    messageController.addListener(checkSubmitButton);
  }

  void checkSubmitButton() {
    setState(() {
      isSubmitEnabled = nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          messageController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 64, 144, 209),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Dashboard(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Your Name',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Your Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    labelText: 'Your Message',
                    border: InputBorder.none,
                  ),
                  maxLines: 5,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: isSubmitEnabled ? submitForm : null,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitForm() {
    nameController.clear();
    emailController.clear();
    messageController.clear();

    setState(() {
      isSubmitEnabled = false; 
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }
}

