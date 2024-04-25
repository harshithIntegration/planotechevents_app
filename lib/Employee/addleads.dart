import 'package:flutter/material.dart';
import 'package:planotechevents/Employee/empdashboard.dart';

class EmployeeRegistrationForm extends StatefulWidget {
  @override
  _EmployeeRegistrationFormState createState() =>
      _EmployeeRegistrationFormState();
}

class _EmployeeRegistrationFormState extends State<EmployeeRegistrationForm> {
  late List<Map<String, dynamic>> _data;

  @override
  void initState() {
    super.initState();
    _data = [
      {
        'leadName': '',
        'leadPhone': '',
        'leadEmail': '',
        'leadShortDescription': '',
        'leadLongDescription': '',
        'leadMeetingDate': '',
        'leadMeetingTime': '',
        'possibleLead': {'right': false, 'wrong': false}
      }
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee Table',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 98, 3, 110),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _data.map<Widget>((item) {
            TextEditingController meetingDateController =
                TextEditingController(text: item['leadMeetingDate']);
            TextEditingController meetingTimeController =
                TextEditingController(text: item['leadMeetingTime']);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 251, 251),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Lead Name',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      item['leadName'] = value;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 251, 251),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Lead Phone',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      item['leadPhone'] = value;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 251, 251),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Lead Email',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      item['leadEmail'] = value;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 251, 251),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Lead Short Description',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      item['leadShortDescription'] = value;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 251, 251),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Lead Long Description',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      item['leadLongDescription'] = value;
                    },
                  ),
                ),
                // const SizedBox(height: 10),
                // Container(
                //   padding: const EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //     color: const Color.fromARGB(255, 252, 251, 251),
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: DropdownButtonFormField<String>(
                //     value: item['description'],
                //     decoration: const InputDecoration(
                //       labelText: 'Description',
                //       border: InputBorder.none,
                //     ),
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         item['description'] = newValue!;
                //       });
                //     },
                //     items: <String>[
                //       'Select', // Unique value for placeholder
                //       'Lead Short Description',
                //       'Lead Long Description'
                //     ]
                //         .map<DropdownMenuItem<String>>(
                //           (String value) => DropdownMenuItem<String>(
                //             value: value,
                //             child: Text(value),
                //           ),
                //         )
                //         .toList(),
                //   ),
                // ),
                // if (item['description'] == 'Lead Short Description' ||
                //     item['description'] == 'Lead Long Description')
                //   Container(
                //     padding: const EdgeInsets.all(10),
                //     decoration: BoxDecoration(
                //       color: const Color.fromARGB(255, 252, 251, 251),
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: TextFormField(
                //       decoration: InputDecoration(
                //         labelText: item['description'],
                //         border: InputBorder.none,
                //       ),
                //       onChanged: (value) {
                //         setState(() {
                //           item['Lead Short Description'] = value;
                //           item['Lead Long Description'] = value;
                //         });
                //       },
                //     ),
                //   ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 251, 251),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Lead Meeting Date',
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
                          item['leadMeetingDate'] =
                              picked.toString().split(' ')[0];
                          meetingDateController.text =
                              picked.toString().split(' ')[0];
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 251, 251),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Lead Meeting Time',
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
                          item['leadMeetingTime'] = picked.format(context);
                          meetingTimeController.text = picked.format(context);
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 251, 251),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Possible Lead',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Radio<bool>(
                            value: true,
                            groupValue: item['possibleLead']['right'],
                            onChanged: (bool? value) {
                              if (value != null && value) {
                                setState(() {
                                  item['possibleLead']['right'] = value;
                                  item['possibleLead']['wrong'] = !value;
                                });
                              }
                            },
                          ),
                          const Text('Right'),
                          Radio<bool>(
                            value: true,
                            groupValue: item['possibleLead']['wrong'],
                            onChanged: (bool? value) {
                              if (value != null && value) {
                                setState(() {
                                  item['possibleLead']['wrong'] = value;
                                  item['possibleLead']['right'] = !value;
                                });
                              }
                            },
                          ),
                          const Text('Wrong'),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_data);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EmployeeDashboard()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 98, 3, 110),
        child: const Text(
          'Submit',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
