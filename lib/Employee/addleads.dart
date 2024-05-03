// import 'package:flutter/material.dart';
// import 'package:planotechevents/Employee/empdashboard.dart';

// class EmployeeRegistrationForm extends StatefulWidget {
//   @override
//   _EmployeeRegistrationFormState createState() =>
//       _EmployeeRegistrationFormState();
// }

// class _EmployeeRegistrationFormState extends State<EmployeeRegistrationForm> {
//   late List<Map<String, dynamic>> _data;

//   @override
//   void initState() {
//     super.initState();
//     _data = [
//       {
//         'leadName': '',
//         'leadPhone': '',
//         'leadEmail': '',
//         'leadShortDescription': '',
//         'leadLongDescription': '',
//         'leadMeetingDate': '',
//         'leadMeetingTime': '',
//         'possibleLead': {'right': false, 'wrong': false}
//       }
//     ];
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Add Leads',
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
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: _data.map<Widget>((item) {
//             TextEditingController meetingDateController =
//                 TextEditingController(text: item['leadMeetingDate']);
//             TextEditingController meetingTimeController =
//                 TextEditingController(text: item['leadMeetingTime']);
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 252, 251, 251),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Lead Name',
//                       border: InputBorder.none,
//                     ),
//                     onChanged: (value) {
//                       item['leadName'] = value;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 252, 251, 251),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Lead Phone',
//                       border: InputBorder.none,
//                     ),
//                     onChanged: (value) {
//                       item['leadPhone'] = value;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 252, 251, 251),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Lead Email',
//                       border: InputBorder.none,
//                     ),
//                     onChanged: (value) {
//                       item['leadEmail'] = value;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 252, 251, 251),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Lead Short Description',
//                       border: InputBorder.none,
//                     ),
//                     onChanged: (value) {
//                       item['leadShortDescription'] = value;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 252, 251, 251),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Lead Long Description',
//                       border: InputBorder.none,
//                     ),
//                     onChanged: (value) {
//                       item['leadLongDescription'] = value;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 252, 251, 251),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Lead Meeting Date',
//                       border: InputBorder.none,
//                     ),
//                     controller: meetingDateController,
//                     onTap: () async {
//                       final DateTime? picked = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime(2020),
//                         lastDate: DateTime(2101),
//                       );
//                       if (picked != null) {
//                         setState(() {
//                           item['leadMeetingDate'] =
//                               picked.toString().split(' ')[0];
//                           meetingDateController.text =
//                               picked.toString().split(' ')[0];
//                         });
//                       }
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 252, 251, 251),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Lead Meeting Time',
//                       border: InputBorder.none,
//                     ),
//                     controller: meetingTimeController,
//                     onTap: () async {
//                       final TimeOfDay? picked = await showTimePicker(
//                         context: context,
//                         initialTime: TimeOfDay.now(),
//                       );
//                       if (picked != null) {
//                         setState(() {
//                           item['leadMeetingTime'] = picked.format(context);
//                           meetingTimeController.text = picked.format(context);
//                         });
//                       }
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 252, 251, 251),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Possible Lead',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Row(
//                         children: [
//                           Radio<bool>(
//                             value: true,
//                             groupValue: item['possibleLead']['right'],
//                             onChanged: (bool? value) {
//                               if (value != null && value) {
//                                 setState(() {
//                                   item['possibleLead']['right'] = value;
//                                   item['possibleLead']['wrong'] = !value;
//                                 });
//                               }
//                             },
//                           ),
//                           const Text('Right'),
//                           Radio<bool>(
//                             value: true,
//                             groupValue: item['possibleLead']['wrong'],
//                             onChanged: (bool? value) {
//                               if (value != null && value) {
//                                 setState(() {
//                                   item['possibleLead']['wrong'] = value;
//                                   item['possibleLead']['right'] = !value;
//                                 });
//                               }
//                             },
//                           ),
//                           const Text('Wrong'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20),
//               ],
//             );
//           }).toList(),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           print(_data);
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => EmployeeDashboard()),
//           );
//         },
//         backgroundColor: const Color.fromARGB(255, 64, 144, 209),
//         child: const Text(
//           'Submit',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeRegistrationForm extends StatefulWidget {
  @override
  _EmployeeRegistrationFormState createState() =>
      _EmployeeRegistrationFormState();
}

class _EmployeeRegistrationFormState extends State<EmployeeRegistrationForm> {
  late Map<String, dynamic> _data;
  final _formKey = GlobalKey<FormState>();
  TextEditingController meetingDateController = TextEditingController();
  TextEditingController meetingTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _data = {
      "employeeId": 29,
      'leadName': '',
      'leadPhone': '',
      'leadEmail': '',
      'leadShortDescription': '',
      'leadBriefDescription': '',
      'leadMeetingDate': '',
      'leadMeetingTime': '',
      "possibleLead": true,
    };
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final jsonData = jsonEncode(_data);
      try {
        final response = await http.post(
          Uri.parse('http://13.201.213.5:4040/emp/leadregister'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonData,
        );
        print(jsonData);

        // Print the response body
        print('Response body: ${response.body}');

        // Clear text fields
        _formKey.currentState!.reset();
        meetingDateController.clear();
        meetingTimeController.clear();
        setState(() {
          _data = {
            "employeeId": 29,
            'leadName': '',
            'leadPhone': '',
            'leadEmail': '',
            'leadShortDescription': '',
            'leadBriefDescription': '',
            'leadMeetingDate': '',
            'leadMeetingTime': '',
            "possibleLead": true,
          };
        });
      } catch (e) {
        print('Error occurred: $e');
        // Handle error accordingly
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee Table',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
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
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextFieldContainer(
                labelText: 'Lead Name',
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter lead name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _data['leadName'] = value!;
                  },
                ),
              ),
              const SizedBox(height: 10),
              _buildTextFieldContainer(
                labelText: 'Lead Phone',
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter lead phone';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _data['leadPhone'] = value!;
                  },
                ),
              ),
              const SizedBox(height: 10),
              _buildTextFieldContainer(
                labelText: 'Lead Email',
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter lead email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _data['leadEmail'] = value!;
                  },
                ),
              ),
              const SizedBox(height: 10),
              _buildTextFieldContainer(
                labelText: 'Lead Short Description',
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter short description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _data['leadShortDescription'] = value!;
                  },
                ),
              ),
              const SizedBox(height: 10),
              _buildTextFieldContainer(
                labelText: 'Lead Long Description',
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter long description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _data['leadBriefDescription'] = value!;
                  },
                ),
              ),
              const SizedBox(height: 10),
              _buildTextFieldContainer(
                labelText: 'Lead Meeting Date',
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  controller: meetingDateController,
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      setState(() {
                        _data['leadMeetingDate'] =
                            picked.toString().split(' ')[0];
                        meetingDateController.text =
                            picked.toString().split(' ')[0];
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              _buildTextFieldContainer(
                labelText: 'Lead Meeting Time',
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  controller: meetingTimeController,
                  onTap: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        _data['leadMeetingTime'] = picked.format(context);
                        meetingTimeController.text = picked.format(context);
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Possible Lead',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: _data['possibleLead'],
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          _data['possibleLead'] = value;
                        });
                      }
                    },
                  ),
                  const Text('Yes'),
                  Radio<bool>(
                    value: false,
                    groupValue: _data['possibleLead'],
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          _data['possibleLead'] = value;
                        });
                      }
                    },
                  ),
                  const Text('No'),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 64, 144, 209),
                ),
                child: const Text('Submit',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldContainer({required String labelText, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 252, 251, 251),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          child,
        ],
      ),
    );
  }
}