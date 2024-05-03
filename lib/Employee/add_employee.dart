// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class AddEmployee extends StatefulWidget {
//   const AddEmployee({Key? key}) : super(key: key);

//   @override
//   State<AddEmployee> createState() => _AddEmployeeState();
// }

// class _AddEmployeeState extends State<AddEmployee> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController employeeNameController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController userDepartmentController = TextEditingController();
//   List<dynamic> userList = [];
//   String? responseMessage;
//   bool? responseStatus;

//   final List<String> departments = [
//     'IT',
//     'Marketing',
//     'Designing',
//     'Accounts',
//     'Production',
//   ];

//   final List<Color> avatarColors = [
//     Colors.blue,
//     Colors.red,
//     Colors.green,
//     Colors.orange,
//     Colors.purple,
//     Colors.pink,
//     Colors.teal,
//     Colors.indigo,
//     Colors.blueGrey,
//     Colors.brown,
//   ];

//   int colorIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   void fetchData() async {
//     const String apiUrl = 'http://3.6.109.119:4040/admin/fetchAllEmployee';

//     try {
//       final http.Response response = await http.get(Uri.parse(apiUrl));
//       var data = jsonDecode(response.body);
//       setState(() {
//         userList = data['userList'];
//         responseMessage = data['message'];
//         responseStatus = data['status'];
//       });
//       print('Fetch All Members Response: $responseStatus');
//     } catch (e) {
//       print('Failed to load data: $e');
//     }
//   }

//   void deleteUser(int userId) async {
//     final String apiUrl ='http://3.6.109.119:4040/admin/deleteEmploee?userId=$userId';

//     try {
//       final http.Response response = await http.delete(
//         Uri.parse(apiUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );

//       if (response.statusCode == 200) {
//         var responseData = jsonDecode(response.body);
//         bool status = responseData['status'];

//         setState(() {
//           responseMessage = responseData['message'];
//           responseStatus = status;
//         });

//         print('Delete Member Response: $responseMessage');
//         print('Status: $status');

//         if (status) {
//           fetchData(); 
//         } else {
//           throw Exception('Failed to delete member');
//         }
//       } else {
//         throw Exception('Failed to delete member: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Failed to delete member: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Add Employee',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(255, 64, 144, 209),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           color: Colors.white,
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 25),
//                 TextFormField(
//                   maxLength: 30,
//                   controller: employeeNameController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: 'Name',
//                     hintText: 'Enter Employee name',
//                     prefixIcon: const Icon(Icons.person),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 25),
//                 TextFormField(
//                   controller: phoneNumberController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: 'Phone Number',
//                     hintText: 'Enter your mobile number',
//                     prefixIcon: const Icon(Icons.phone),
//                   ),
//                   keyboardType: TextInputType.phone,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your mobile number';
//                     }
//                     if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//                       return 'Please enter a valid 10-digit mobile number';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 25),
//                 TextFormField(
//                   maxLength: 35,
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: 'Email',
//                     hintText: 'Enter your email',
//                     prefixIcon: const Icon(Icons.email),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     } else if (!RegExp(
//                             r"^[a-zA-Z0-9.a-zA-Z0-9,!#$%&'*+-/=?^_`{|~}]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                         .hasMatch(value)) {
//                       return 'Please enter a valid email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 25),
//                 DropdownButtonFormField(
//                   value: null,
//                   items: departments.map((String department) {
//                     return DropdownMenuItem(
//                       value: department,
//                       child: Text(department),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       userDepartmentController.text = value.toString();
//                     });
//                   },
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: 'Department',
//                     prefixIcon: const Icon(Icons.work),
//                   ),
//                   validator: (value) {
//                     if (value == null) {
//                       return 'Please select a department';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 25),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       if (_formKey.currentState!.validate()) {
//                         String name = employeeNameController.text.trim();
//                         String phoneNumber = phoneNumberController.text.trim();
//                         String email = emailController.text.trim();
//                         // String password = passwordController.text.trim();
//                         String department = userDepartmentController.text.trim();
//                         try {
//                           const String apiUrl ='http://3.6.109.119:4040/admin/addEmployee';
//                           final http.Response response = await http.post(
//                             Uri.parse(apiUrl),
//                             body: jsonEncode({
//                               'userName': name,
//                               'userPhoneNumber': phoneNumber,
//                               'userEmail': email,
//                               // 'userPassword': password,
//                               'userDepartment': department,
//                             }),
//                             headers: <String, String>{
//                               'Content-Type': 'application/json; charset=UTF-8',
//                             },
//                           );

//                           var responseData = jsonDecode(response.body);
//                           setState(() {
//                             responseMessage = responseData['message'];
//                             responseStatus = responseData['status'];
//                           });
//                           print('Add Member Response: $responseMessage');
//                           print('Status: $responseStatus');

//                           if (responseStatus == true) {
//                             fetchData(); // Refresh data after adding
//                             employeeNameController.clear();
//                             phoneNumberController.clear();
//                             emailController.clear();
//                             // passwordController.clear();
//                             userDepartmentController.clear();
//                           } else {
//                             throw Exception('Failed to add member');
//                           }
//                         } catch (e) {
//                           print('Failed to add member: $e');
//                         }
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 24, 137, 182),
//                       foregroundColor: Colors.white,
//                     ),
//                     child: const Text('Save'),
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//                 SizedBox(
//                   height: 450,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: userList.length,
//                     itemBuilder: (context, index) {
//                       Color color = avatarColors[colorIndex % avatarColors.length];
//                       colorIndex++;

//                       return ListTile(
//                         title: Text(userList[index]['userName']),
//                         subtitle: Text(userList[index]['userPosition']),
//                         leading: CircleAvatar(
//                           backgroundColor: color,
//                           child: Text(
//                             userList[index]['userName'][0].toUpperCase(),
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         trailing: IconButton(
//                           icon: const Icon(Icons.delete),
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return AlertDialog(
//                                   title: const Text('Confirm Deletion'),
//                                   content: const Text(
//                                       'Are you sure you want to delete this member?'),
//                                   actions: [
//                                     TextButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       child: const Text('Cancel'),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         int id = userList[index]['userId'];
//                                         deleteUser(id);

//                                         Navigator.pop(context);
//                                       },
//                                       child: const Text('Delete'),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userDepartmentController = TextEditingController();
  List<dynamic> userList = [];
  String? responseMessage;
  bool? responseStatus;
  String? selectedDepartment;

final List<String> departments = [
  'Select',
  'IT',
  'Marketing',
  'Designing',
  'Accounts',
  'Production',
];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    // Implement your fetchData method here
  }

  void showSnackBar(String message, bool isSuccess) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: isSuccess ? Colors.green : Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
void addUser() async {
  try {
    // Prepare data for the request
    Map<String, dynamic> userData = {
      'userName': employeeNameController.text.trim(),
      'userPhone': phoneNumberController.text.trim(),
      'userEmail': emailController.text.trim(),
      'userDepartment': userDepartmentController.text.trim(),
      'userPassword': phoneNumberController.text.trim(),
    };

    // Convert userData to JSON
    String jsonData = jsonEncode(userData);

    // Send POST request with JSON data
    final http.Response response = await http.post(
      Uri.parse('http://13.201.213.5:4040/admin/addemployee'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );

    // Parse response
    var responseData = jsonDecode(response.body);
    bool isSuccess = responseData['status'];

    // Show SnackBar based on success status
    showSnackBar(isSuccess ? 'User added successfully' : 'Failed to add user', isSuccess);

    // If success, clear text fields and reset dropdown
    if (isSuccess) {
      // Clear text controllers
      employeeNameController.clear();
      phoneNumberController.clear();
      emailController.clear();

      // Reset dropdown to initial value
      // Reset dropdown to initial value
setState(() {
  selectedDepartment = 'Select';
});

    }

    // If success, fetch data
    if (isSuccess) {
      fetchData();
    }
  } catch (e) {
    print('Failed to add member: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Employee Page',
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 64, 144, 209),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                TextFormField(
                  maxLength: 30,
                  controller: employeeNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Name',
                    hintText: 'Enter Employee name',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Phone Number',
                    hintText: 'Enter your mobile number',
                    prefixIcon: const Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit mobile number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  maxLength: 35,
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: const Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                ),
                const SizedBox(height: 25),
                
DropdownButtonFormField(
  value: selectedDepartment,
  items: departments.map((String department) {
    return DropdownMenuItem(
      value: department,
      child: Text(department),
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      selectedDepartment = value as String?;
    });
  },
  decoration: InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    labelText: 'Department',
    prefixIcon: const Icon(Icons.work),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please select a department';
    }
    return null;
  },
),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addUser();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 64, 144, 209),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Save'),
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