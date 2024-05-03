import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planotechevents/admin/adminpage.dart';
import 'package:planotechevents/profile.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late Map<String, dynamic> response;
  XFile? _imageFile;

  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  
  final String _initialName = "Sanket";
  final String _initialPhone = "1234567890";
  final String _initialEmail = "sanket@gmail.com";

  @override
  void initState() {
    super.initState();
    
    _nameController.text = _initialName;
    _phoneController.text = _initialPhone;
    _emailController.text = _initialEmail;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
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
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: kToolbarHeight),
              GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: _imageFile != null
                        ? FileImage(File(_imageFile!.path))
                            as ImageProvider<Object>?
                        : const AssetImage('assets/avatar.png'),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              itemProfile('Name', _nameController, _initialName, Icons.person),
              const SizedBox(height: 10),
              itemProfile(
                  'Phone', _phoneController, _initialPhone, Icons.phone),
              const SizedBox(height: 10),
              itemProfile(
                  'Email', _emailController, _initialEmail, Icons.email),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal:5),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color:Color.fromARGB(255, 64, 144, 209),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  void _saveProfile() {
    
    String newName = _nameController.text;
    String newPhone = _phoneController.text;
    String newEmail = _emailController.text;

    print('New Name: $newName');
    print('New Phone: $newPhone');
    print('New Email: $newEmail');
    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdminPage()),
    );
  }

  Widget itemProfile(String title, TextEditingController controller,
      String initialValue, IconData icon) {
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
        subtitle: TextField(
          controller: controller,
          enabled: controller.text ==
              initialValue, // Enable editing only if the value is initial
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
