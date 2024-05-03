import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:planotechevents/edit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic> response = {};

  @override
  void initState() {
    super.initState();
    fetchStoredResponse();
  }

  Future<void> fetchStoredResponse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedResponse = prefs.getString('response');
    if (storedResponse != null) {
      try {
        setState(() {
          response = json.decode(storedResponse);
        });
      } catch (e) {
        print("Error decoding stored response: $e");
      }
    } else {
      print("No stored response found.");
    }
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 64, 144, 209),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight),
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
              ),
              const SizedBox(height: 20),           
                  if (response.isNotEmpty)
                  itemProfile('Name', response['body']['userName'], Icons.person),
                  const SizedBox(height: 10),
                  if (response.isNotEmpty)
                  itemProfile('Phone', response['body']['userPhone'].toString(), Icons.phone),
                  const SizedBox(height: 10),
                  if (response.isNotEmpty)
                  itemProfile('Email', response['body']['userEmail'], Icons.email),
                  if (!response.isNotEmpty)
                  itemProfile('Name', "", Icons.person),
                  const SizedBox(height: 10),
                  if (!response.isNotEmpty)
                  itemProfile('Phone', "", Icons.phone),
                  const SizedBox(height: 10),
                  if (!response.isNotEmpty)
                  itemProfile('Email', "", Icons.email),
              // if (response.isNotEmpty)
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const EditPage()),
              //     );
              //   },
              //   child: const Text(
              //     'Edit Profile',
              //     style: TextStyle(
              //       color: Color.fromARGB(255, 64, 144, 209),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 5),
            color: Color.fromARGB(255, 240, 221, 221),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: TextFormField(
          initialValue: subtitle,
          readOnly: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
        leading: Icon(icon),
        tileColor: Colors.white,
      ),
    );
  }
}
