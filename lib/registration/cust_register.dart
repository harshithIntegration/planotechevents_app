// import 'package:planotechevents/screens/employee_login.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _numberController;
//   late TextEditingController _emailController;
//   late TextEditingController _venueController;
//   late TextEditingController _setupDateController;
//   late TextEditingController _eventDateController;
//   late TextEditingController _eventPackController;
//   late TextEditingController _eventAgendaController;
//   late String _selectedSetupHour = '12';
//   late String _selectedSetupMinute = '00';
//   late String _selectedSetupPeriod = 'AM';
//   late String _selectedEventHour = '12';
//   late String _selectedEventMinute = '00';
//   late String _selectedEventPeriod = 'AM';

//   final _formkey = GlobalKey<FormState>();
//   Map<String, dynamic> item = {};

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _numberController = TextEditingController();
//     _emailController = TextEditingController();
//     _venueController = TextEditingController();
//     _setupDateController = TextEditingController();
//     _eventDateController = TextEditingController();
//     _eventPackController = TextEditingController();
//     _eventAgendaController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _numberController.dispose();
//     _emailController.dispose();
//     _venueController.dispose();
//     _setupDateController.dispose();
//     _eventDateController.dispose();
//     _eventPackController.dispose();
//     _eventAgendaController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Registration Form',
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
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const EmployeeLogin()),
//                   );
//                 },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color.fromARGB(0, 100, 226, 128),
//                 const Color.fromARGB(255, 64, 144, 209),
//               ],
//             ),
//           ),
//           child: Form(
//             key: _formkey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 const SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _nameController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                   maxLength: 30,
//                   decoration: InputDecoration(
//                     labelText: 'Name',
//                     hintText: 'Enter your name',
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: const Icon(Icons.person),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 20.0, horizontal: 16.0),
//                   ),
//                 ),
//                 const SizedBox(height: 2.0),
//                 TextFormField(
//                   controller: _numberController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your mobile number';
//                     }
//                     if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//                       return 'Please enter a valid 10-digit mobile number';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Mobile number',
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Enter your mobile number',
//                     prefixIcon: const Icon(Icons.call_outlined),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 20.0, horizontal: 16.0),
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _emailController,
//                   maxLength: 35,
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
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: const Icon(Icons.mail),
//                     hintText: 'Enter your email',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 20.0, horizontal: 16.0),
//                   ),
//                 ),
//                 const SizedBox(height: 2.0),
//                 TextFormField(
//                   controller: _venueController,
//                   maxLength: 100,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     labelText: "Enter Venue...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: const Icon(Icons.location_on),
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 20.0, horizontal: 16.0),
//                   ),
//                 ),
//                 const SizedBox(height: 2.0),
//                 GestureDetector(
//                   onTap: () async {
//                     final DateTime? picked = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2020),
//                       lastDate: DateTime(2101),
//                     );
//                     if (picked != null) {
//                       setState(() {
//                         item['leadMeetingDate'] =
//                             picked.toString().split(' ')[0];
//                         _eventDateController.text =
//                             picked.toString().split(' ')[0];
//                       });
//                     }
//                   },
//                   child: AbsorbPointer(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Enter Event Date...',
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         prefixIcon: const Icon(Icons.date_range),
//                         contentPadding: const EdgeInsets.symmetric(
//                             vertical: 20.0, horizontal: 16.0),
//                       ),
//                       controller: _eventDateController,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 2.0),
//                 Container(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         '  Event Time',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(color: Colors.black),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 8.0, horizontal: 16.0),
//                           child: TextField(
//                             controller: TextEditingController(
//                                 text:
//                                     '$_selectedEventHour:$_selectedEventMinute $_selectedEventPeriod'),
//                             readOnly: true,
//                             onTap: () async {
//                               final TimeOfDay? picked = await showTimePicker(
//                                 context: context,
//                                 initialTime: TimeOfDay.now(),
//                               );
//                               if (picked != null) {
//                                 setState(() {
//                                   _selectedEventHour =
//                                       picked.hour.toString().padLeft(2, '0');
//                                   _selectedEventMinute =
//                                       picked.minute.toString().padLeft(2, '0');
//                                   _selectedEventPeriod =
//                                       picked.hour < 12 ? 'AM' : 'PM';
//                                 });
//                               }
//                             },
//                             decoration: const InputDecoration(
//                               border: InputBorder.none,
                              
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _eventPackController,
//                   maxLength: 7,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: "Enter Event pack...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: const Icon(Icons.control_point_outlined),
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 20.0, horizontal: 16.0),
//                   ),
//                 ),
//                 const SizedBox(height: 2.0),
//                 GestureDetector(
//                   onTap: () async {
//                     final DateTime? picked = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2020),
//                       lastDate: DateTime(2101),
//                     );
//                     if (picked != null) {
//                       setState(() {
//                         item['leadMeetingDate'] =
//                             picked.toString().split(' ')[0];
//                         _setupDateController.text =
//                             picked.toString().split(' ')[0];
//                       });
//                     }
//                   },
//                   child: AbsorbPointer(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Enter setup Date...',
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         prefixIcon: const Icon(Icons.date_range),
//                         contentPadding: const EdgeInsets.symmetric(
//                             vertical: 20.0, horizontal: 16.0),
//                       ),
//                       controller: _setupDateController,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 2.0),
//                 Container(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         '  Setup Time',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(color: Colors.black),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 8.0, horizontal: 16.0),
//                           child: TextField(
//                             controller: TextEditingController(
//                                 text:
//                                     '$_selectedSetupHour:$_selectedSetupMinute $_selectedSetupPeriod'),
//                             readOnly: true,
//                             onTap: () async {
//                               final TimeOfDay? picked = await showTimePicker(
//                                 context: context,
//                                 initialTime: TimeOfDay.now(),
//                               );
//                               if (picked != null) {
//                                 setState(() {
//                                   _selectedSetupHour =
//                                       picked.hour.toString().padLeft(2, '0');
//                                   _selectedSetupMinute =
//                                       picked.minute.toString().padLeft(2, '0');
//                                   _selectedSetupPeriod =
//                                       picked.hour < 12 ? 'AM' : 'PM';
//                                 });
//                               }
//                             },
//                             decoration: const InputDecoration(
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _eventAgendaController,
//                   keyboardType: TextInputType.text,
//                   maxLines: 5,
//                   maxLength: 2000,
//                   decoration: InputDecoration(
//                     labelText: "Enter Event Agenda...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: const Icon(Icons.event_note),
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 20.0, horizontal: 16.0),
//                   ),
//                 ),
//                 const SizedBox(height: 30.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formkey.currentState!.validate()) {
                      
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: const Color.fromARGB(255, 64, 144, 209),
//                     padding: const EdgeInsets.symmetric(vertical: 16.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: const Text('Register'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'package:dapp/screens/employee_login.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _numberController;
//   late TextEditingController _emailController;
//   late TextEditingController _venueController;
//   late TextEditingController _setupTimeController;
//   late TextEditingController _setupDateController;
//   late TextEditingController _eventTimeController;
//   late TextEditingController _eventDateController;
//   late TextEditingController _eventPackController;
//   late TextEditingController _eventAgendaController;

//   final _formkey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _numberController = TextEditingController();
//     _emailController = TextEditingController();
//     _venueController = TextEditingController();
//     _setupTimeController = TextEditingController();
//     _setupDateController = TextEditingController();
//     _eventTimeController = TextEditingController();
//     _eventDateController = TextEditingController();
//     _eventPackController = TextEditingController();
//     _eventAgendaController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _numberController.dispose();
//     _emailController.dispose();
//     _venueController.dispose();
//     _setupTimeController.dispose();
//     _setupDateController.dispose();
//     _eventTimeController.dispose();
//     _eventDateController.dispose();
//     _eventPackController.dispose();
//     _eventAgendaController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Registration Form"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => EmployeeLogin(),
//               ),
//             );
//           },
//           color: Colors.white,
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.red[300],
//         foregroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Color.fromARGB(0, 100, 226, 128), const Color.fromARGB(255, 212, 117, 117)],
//             ),
//           ),
//           child: Form(
//             key: _formkey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 TextFormField(
//                   controller: _nameController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                   maxLength: 30,
//                   decoration: InputDecoration(
//                     label: Text('Name'),
//                     hintText: 'Enter your name',
//                       filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 2.0),
//                         TextFormField(
//                           controller: _numberController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your mobile number';
//                             }
//                             if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//                               return 'Please enter a valid 10-digit mobile number';
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             label: Text('Mobile number'),
//                               filled: true,
//                     fillColor: Colors.white,
//                             hintText: 'Enter your mobile number',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                 SizedBox(height: 20.0),
//                         TextFormField(
//                           controller: _emailController,
//                           maxLength: 35,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your email';
//                             } else if (!RegExp(
//                                     r"^[a-zA-Z0-9.a-zA-Z0-9,!#$%&'*+-/=?^_`{|~}]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                 .hasMatch(value)) {
//                               return 'Please enter a valid email';
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             label: Text('Email'),
//                               filled: true,
//                     fillColor: Colors.white,
//                             hintText: 'Enter your email',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                 SizedBox(height: 2.0),
//                 TextFormField(
//                   controller: _venueController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     labelText: "Enter Venue...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: Icon(Icons.location_on),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _setupTimeController,
//                   keyboardType: TextInputType.datetime,
//                   decoration: InputDecoration(
//                     labelText: "Enter Setup Time...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: Icon(Icons.access_time),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _setupDateController,
//                   keyboardType: TextInputType.datetime,
//                   decoration: InputDecoration(
//                     labelText: "Enter Setup Date...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: Icon(Icons.date_range),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _eventTimeController,
//                   keyboardType: TextInputType.datetime,
//                   decoration: InputDecoration(
//                     labelText: "Enter Event Time...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: Icon(Icons.access_time),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _eventDateController,
//                   keyboardType: TextInputType.datetime,
//                   decoration: InputDecoration(
//                     labelText: "Enter Event Date...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: Icon(Icons.date_range),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _eventPackController,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     labelText: "Enter Event Pack...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: Icon(Icons.card_giftcard),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _eventAgendaController,
//                   keyboardType: TextInputType.text,
//                   maxLines: 5, // Adjust the number of lines here
//                   decoration: InputDecoration(
//                     labelText: "Enter Event Agenda...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: Icon(Icons.event_note),
//                   ),
//                 ),
//                 SizedBox(height: 30.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formkey.currentState!.validate()) {
//                       // Process registration
//                     }
//                   },
//                   child: Text('Register'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: Colors.red[300],
//                     padding: EdgeInsets.symmetric(vertical: 16.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
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





// import 'package:dapp/screens/employee_login.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _numberController;
//   late TextEditingController _emailController;
//   late TextEditingController _venueController;
//   late TextEditingController _setupDateController;
//   late TextEditingController _eventDateController;
//   late TextEditingController _eventPackController;
//   late TextEditingController _eventAgendaController;
//   late String _selectedSetupHour = '12';
//   late String _selectedSetupMinute = '00';
//   late String _selectedSetupPeriod = 'AM';
//   late String _selectedEventHour = '12';
//   late String _selectedEventMinute = '00';
//   late String _selectedEventPeriod = 'AM';

//   final _formkey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _numberController = TextEditingController();
//     _emailController = TextEditingController();
//     _venueController = TextEditingController();
//     _setupDateController = TextEditingController();
//     _eventDateController = TextEditingController();
//     _eventPackController = TextEditingController();
//     _eventAgendaController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _numberController.dispose();
//     _emailController.dispose();
//     _venueController.dispose();
//     _setupDateController.dispose();
//     _eventDateController.dispose();
//     _eventPackController.dispose();
//     _eventAgendaController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Registration Form"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => EmployeeLogin(),
//               ),
//             );
//           },
//           color: Colors.white,
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.red[300],
//         foregroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Color.fromARGB(0, 100, 226, 128), const Color.fromARGB(255, 212, 117, 117)],
//             ),
//           ),
//           child: Form(
//             key: _formkey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 TextFormField(
//                   controller: _nameController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                   maxLength: 30,
//                   decoration: InputDecoration(
//                     label: Text('Name'),
//                     hintText: 'Enter your name',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _numberController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your mobile number';
//                     }
//                     if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//                       return 'Please enter a valid 10-digit mobile number';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     label: Text('Mobile number'),
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Enter your mobile number',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _emailController,
//                   maxLength: 35,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     } else if (!RegExp(
//                         r"^[a-zA-Z0-9.a-zA-Z0-9,!#$%&'*+-/=?^_`{|~}]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                         .hasMatch(value)) {
//                       return 'Please enter a valid email';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     label: Text('Email'),
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Enter your email',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _venueController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     labelText: "Enter Venue...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: Icon(Icons.location_on),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         value: _selectedEventHour,
//                         onChanged: (value) {
//                           setState(() {
//                             _selectedEventHour = value!;
//                           });
//                         },
//                         items: List.generate(
//                           12,
//                               (index) => DropdownMenuItem(
//                             value: (index + 1).toString().padLeft(2, '0'),
//                             child: Text((index + 1).toString().padLeft(2, '0')),
//                           ),
//                         ),
//                         decoration: InputDecoration(
//                           labelText: 'Hour',
//                           filled: true,
//                           fillColor: Colors.white,
//                           // border: OutlineInputBorder(
//                           //   borderRadius: BorderRadius.circular(10.0),
//                           // ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         value: _selectedEventMinute,
//                         onChanged: (value) {
//                           setState(() {
//                             _selectedEventMinute = value!;
//                           });
//                         },
//                         items: List.generate(
//                           60,
//                               (index) => DropdownMenuItem(
//                             value: index.toString().padLeft(2, '0'),
//                             child: Text(index.toString().padLeft(2, '0')),
//                           ),
//                         ),
//                         decoration: InputDecoration(
//                           labelText: 'Minute',
//                           filled: true,
//                           fillColor: Colors.white,
//                           // border: OutlineInputBorder(
//                           //   borderRadius: BorderRadius.circular(10.0),
//                           // ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         value: _selectedEventPeriod,
//                         onChanged: (value) {
//                           setState(() {
//                             _selectedEventPeriod = value!;
//                           });
//                         },
//                         items: ['AM', 'PM']
//                             .map(
//                                   (period) => DropdownMenuItem(
//                                 value: period,
//                                 child: Text(period),
//                               ),
//                         )
//                             .toList(),
//                         decoration: InputDecoration(
//                           labelText: 'AM/PM',
//                           filled: true,
//                           fillColor: Colors.white,
//                           // border: OutlineInputBorder(
//                           //   borderRadius: BorderRadius.circular(10.0),
//                           // ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _setupDateController,
//                   keyboardType: TextInputType.datetime,
//                   decoration: InputDecoration(
//                     labelText: "Enter Setup Date...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: Icon(Icons.date_range),
//                   ),
//                 ),

//                 SizedBox(height: 20.0),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         value: _selectedSetupHour,
//                         onChanged: (value) {
//                           setState(() {
//                             _selectedSetupHour = value!;
//                           });
//                         },
//                         items: List.generate(
//                           12,
//                               (index) => DropdownMenuItem(
//                             value: (index + 1).toString().padLeft(2, '0'),
//                             child: Text((index + 1).toString().padLeft(2, '0')),
//                           ),
//                         ),
//                         decoration: InputDecoration(
//                           labelText: 'Hour',
//                           filled: true,
//                           fillColor: Colors.white,
//                           // border: OutlineInputBorder(
//                           //   borderRadius: BorderRadius.circular(10.0),
//                           // ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         value: _selectedSetupMinute,
//                         onChanged: (value) {
//                           setState(() {
//                             _selectedSetupMinute = value!;
//                           });
//                         },
//                         items: List.generate(
//                           60,
//                               (index) => DropdownMenuItem(
//                             value: index.toString().padLeft(2, '0'),
//                             child: Text(index.toString().padLeft(2, '0')),
//                           ),
//                         ),
//                         decoration: InputDecoration(
//                           labelText: 'Minute',
//                           filled: true,
//                           fillColor: Colors.white,
//                           // border: OutlineInputBorder(
//                           //   borderRadius: BorderRadius.circular(10.0),
//                           // ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         value: _selectedSetupPeriod,
//                         onChanged: (value) {
//                           setState(() {
//                             _selectedSetupPeriod = value!;
//                           });
//                         },
//                         items: ['AM', 'PM']
//                             .map(
//                                   (period) => DropdownMenuItem(
//                                 value: period,
//                                 child: Text(period),
//                               ),
//                         )
//                             .toList(),
//                         decoration: InputDecoration(
//                           labelText: 'AM/PM',
//                           filled: true,
//                           fillColor: Colors.white,
//                           // border: OutlineInputBorder(
//                           //   borderRadius: BorderRadius.circular(10.0),
//                           // ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),



//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _eventDateController,
//                   keyboardType: TextInputType.datetime,
//                   decoration: InputDecoration(
//                     labelText: "Enter Event Date...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: Icon(Icons.date_range),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _eventPackController,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     labelText: "Enter Event Pack...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: Icon(Icons.card_giftcard),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: _eventAgendaController,
//                   keyboardType: TextInputType.text,
//                   maxLines: 5, // Adjust the number of lines here
//                   decoration: InputDecoration(
//                     labelText: "Enter Event Agenda...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     prefixIcon: Icon(Icons.event_note),
//                   ),
//                 ),
//                 SizedBox(height: 30.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formkey.currentState!.validate()) {
//                       // Process registration
//                     }
//                   },
//                   child: Text('Register'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: Colors.red[300],
//                     padding: EdgeInsets.symmetric(vertical: 16.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
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
import 'package:http/http.dart' as http; // Import the http package
import 'package:planotechevents/screens/employee_login.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final _formkey = GlobalKey<FormState>();
Map<String, dynamic> formData = {}; 


class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _nameController;
  late TextEditingController _numberController;
  late TextEditingController _emailController;
  late TextEditingController _venueController;
  late TextEditingController _setupDateController;
  late TextEditingController _eventDateController;
  late TextEditingController _eventPackController;
  late TextEditingController _eventAgendaController;
  late String _selectedSetupHour = '12';
  late String _selectedSetupMinute = '00';
  late String _selectedSetupPeriod = 'AM';
  late String _selectedEventHour = '12';
  late String _selectedEventMinute = '00';
  late String _selectedEventPeriod = 'AM';

  final _formkey = GlobalKey<FormState>();
Map<String, dynamic> item = {};

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _emailController = TextEditingController();
    _venueController = TextEditingController();
    _setupDateController = TextEditingController();
    _eventDateController = TextEditingController();
    _eventPackController = TextEditingController();
    _eventAgendaController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    _venueController.dispose();
    _setupDateController.dispose();
    _eventDateController.dispose();
    _eventPackController.dispose();
    _eventAgendaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Form"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EmployeeLogin(),
              ),
            );
          },
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.red[300],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(0, 100, 226, 128), Color.fromARGB(255, 212, 117, 117)],
            ),
          ),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    filled: true,
                    fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.person),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  ),
                ),
                const SizedBox(height: 2.0),
                TextFormField(
                  controller: _numberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit mobile number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Mobile number',
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your mobile number',
                                      prefixIcon: const Icon(Icons.call_outlined),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  ),
                ),
                const SizedBox(height: 20.0),
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
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                                      prefixIcon: const Icon(Icons.mail),
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  ),
                ),
                const SizedBox(height: 2.0),
                TextFormField(
                  controller: _venueController,
                   maxLength: 100,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Enter Venue...",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: const Icon(Icons.location_on),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  ),
                ),
                                const SizedBox(height: 2.0),
Container(
  child: GestureDetector(
    onTap: () async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        setState(() {
          item['leadMeetingDate'] = picked.toString().split(' ')[0];
          _eventDateController.text = picked.toString().split(' ')[0];
        });
      }
    },
    child: AbsorbPointer(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Enter Event Date...',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: const Icon(Icons.date_range),
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        ),
        controller: _eventDateController,
      ),
    ),
  ),
),
                const SizedBox(height: 2.0),
Container(
  padding: const EdgeInsets.symmetric(vertical: 10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Event Time',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: TextField(
            controller: TextEditingController(
              text: '$_selectedEventHour:$_selectedEventMinute $_selectedEventPeriod'
            ),
            readOnly: true,
            onTap: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (picked != null) {
                setState(() {
                  _selectedEventHour = picked.hour.toString().padLeft(2, '0');
                  _selectedEventMinute = picked.minute.toString().padLeft(2, '0');
                  _selectedEventPeriod = picked.hour < 12 ? 'AM' : 'PM';
                });
              }
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
  //  prefixIcon: Icon(Icons.timelapse_sharp),
            ),
          ),
        ),
      ),
    ],
  ),
),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _eventPackController,
                   maxLength: 7,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter Event pack...",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: const Icon(Icons.control_point_outlined),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  ),
                ),

                const SizedBox(height: 2.0),
Container(
  child: GestureDetector(
    onTap: () async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        setState(() {
          item['leadMeetingDate'] = picked.toString().split(' ')[0];
          _setupDateController.text = picked.toString().split(' ')[0];
        });
      }
    },
    child: AbsorbPointer(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Enter setup Date...',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: const Icon(Icons.date_range),
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        ),
        controller: _setupDateController,
      ),
    ),
  ),
),
                const SizedBox(height: 2.0),
Container(
  padding: const EdgeInsets.symmetric(vertical: 10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        '  Setup Time',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: TextField(
            controller: TextEditingController(
              text: '$_selectedSetupHour:$_selectedSetupMinute $_selectedSetupPeriod'
            ),
            readOnly: true,
            onTap: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (picked != null) {
                setState(() {
                  _selectedSetupHour = picked.hour.toString().padLeft(2, '0');
                  _selectedSetupMinute = picked.minute.toString().padLeft(2, '0');
                  _selectedSetupPeriod = picked.hour < 12 ? 'AM' : 'PM';
                });
              }
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    ],
  ),
),

     const SizedBox(height: 20.0),
                TextFormField(
                  controller: _eventAgendaController,
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                   maxLength: 2000,
                  decoration: InputDecoration(
                    labelText: "Enter Event Agenda...",
                    filled: true,
                    
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                                        prefixIcon: const Icon(Icons.event_note),

                    contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  ),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  
                // Inside your ElevatedButton onPressed callback
// Inside your ElevatedButton onPressed callback
onPressed: () async {
  if (_formkey.currentState!.validate()) {
    // Update formData with the form fields
    formData['name'] = _nameController.text; // Change to 'Body building'
    formData['phone'] = _numberController.text; // Change to '9611572990'
    formData['email'] = _emailController.text; // Change to 'harshith.shivamoggi@gmail.com'
    formData['venue'] = _venueController.text; // Change to 'Banglore'
    formData['eventDate'] = _eventDateController.text; // Change to '2024-04-23'
    formData['eventTime'] = '$_selectedEventHour:$_selectedEventMinute $_selectedEventPeriod'; // Change to '10:00 AM'
    formData['eventPack'] = int.parse(_eventPackController.text); // Change to 2
    formData['eventSetupDate'] = _setupDateController.text; // Change to '2024-04-22'
    formData['eventSetupTime'] = '$_selectedSetupHour:$_selectedSetupMinute $_selectedSetupPeriod'; // Change to '2:00 PM'
    formData['agenda'] = _eventAgendaController.text; // Change to 'Event Agenda'
    formData['date'] = _eventDateController.text; // Change to '2024-04-23'
    formData['time'] = '$_selectedEventHour:$_selectedEventMinute $_selectedEventPeriod'; // Change to '10:00 AM'
    formData['customerId'] = 1; // Change to 1

    // Encode formData to JSON
    String jsonData = jsonEncode(formData);
    print(jsonData);

    try {
      // Convert the URL string to a Uri object
      Uri url = Uri.parse('http://13.201.213.5:4040/customer/customereventregister');

      // Send jsonData to your Spring Boot backend
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonData,
      );
print(response.body);
      // Check the response status code
      if (response.statusCode == 200) {
        // Handle successful response
        print("Data sent successfully!");
      } else {
        // Handle error response
        print("Failed to send data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle error
      print("Error: $e");
    }

    // After sending data, you can clear the form fields if needed
    _nameController.clear();
    _numberController.clear();
    _emailController.clear();
    _venueController.clear();
    _eventDateController.clear();
    _eventPackController.clear();
    _setupDateController.clear();
    _eventAgendaController.clear();
  }
},

                  child: const Text('Register'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.red[300],
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
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