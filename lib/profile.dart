import 'package:flutter/material.dart';
import 'package:planotechevents/edit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Map<String, dynamic> response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Page',
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
              const SizedBox(height: 40),
              // if (response['body'] != null)
              if (true) ...[
                // itemProfile('Name', response['body']['userName'], Icons.person),
                itemProfile('Name', "Sanket", Icons.person),
                const SizedBox(height: 10),
                // itemProfile('Phone', response['body']['userPhone'].toString(), Icons.phone),
                itemProfile('Phone', "1234567890", Icons.phone),
                const SizedBox(height: 10),
                // itemProfile('Email', response['body']['userEmail'], Icons.email),
                itemProfile('Email', "sanket@gmail.com", Icons.email),
              ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditPage()),
                  );
                },
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 64, 144, 209),
                  ),
                ),
              ),
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
