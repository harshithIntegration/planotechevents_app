import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserData {
  final int id;
  final int customerId;
  final String name;
  final String phone;
  final String email;
  final String venue;
  final String eventDate;
  final String eventTime;
  final int eventPack;
  final String eventSetupDate;
  final String eventSetupTime;
  final String agenda;
  final String date;
  final String time;

  UserData({
    required this.id,
    required this.customerId,
    required this.name,
    required this.phone,
    required this.email,
    required this.venue,
    required this.eventDate,
    required this.eventTime,
    required this.eventPack,
    required this.eventSetupDate,
    required this.eventSetupTime,
    required this.agenda,
    required this.date,
    required this.time,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      customerId: json['customerId'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      venue: json['venue'],
      eventDate: json['eventDate'],
      eventTime: json['eventTime'],
      eventPack: json['eventPack'],
      eventSetupDate: json['eventSetupDate'],
      eventSetupTime: json['eventSetupTime'],
      agenda: json['agenda'],
      date: json['date'],
      time: json['time'],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViewAllCustomerRegister(),
    );
  }
}

class ViewAllCustomerRegister extends StatefulWidget {
  @override
  _ViewAllCustomerRegisterState createState() => _ViewAllCustomerRegisterState();
}

class _ViewAllCustomerRegisterState extends State<ViewAllCustomerRegister> {
  List<UserData> userList = [];
  List<UserData> filteredList = [];
  List<Color> _avatarColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.blueGrey,
    Colors.brown,
  ];
  int _colorIndex = 0;
  TextEditingController _nameFilterController = TextEditingController();
  TextEditingController _dateFilterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String url = 'http://13.201.213.5:4040/admin/fetchallcustomereventregister';

    try {
      http.Response response = await http.post(Uri.parse(url));
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          userList = (jsonData['userList'] as List)
              .map((item) => UserData.fromJson(item))
              .toList();
          filteredList = List<UserData>.from(userList);
        });
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void filterByName(String name) {
    setState(() {
      filteredList = userList
          .where((user) => user.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
    });
  }

  void filterByDate(String date) {
    setState(() {
      filteredList = userList
          .where((user) => user.eventDate == date)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Details',
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 64, 144, 209),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameFilterController,
              onChanged: (value) {
                filterByName(value);
              },
              decoration: const InputDecoration(
                labelText: 'Filter by Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _dateFilterController,
              readOnly: true,
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (selectedDate != null) {
                  String formattedDate = selectedDate.toString().substring(0, 10);
                  _dateFilterController.text = formattedDate;
                  filterByDate(formattedDate);
                }
              },
              decoration: const InputDecoration(
                labelText: 'Filter by Date',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                UserData user = filteredList[index];
                Color color = _avatarColors[_colorIndex % _avatarColors.length];
                _colorIndex++;
                return ListTile(
                  leading: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                    ),
                    child: Center(
                      child: Text(
                        user.name[0].toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${user.name}', style: const TextStyle(fontSize: 16)),
                      Text('Email: ${user.email}', style: const TextStyle(fontSize: 14)),
                      Text('Phone: ${user.phone}', style: const TextStyle(fontSize: 14)),
                      Text('Venue: ${user.venue}', style: const TextStyle(fontSize: 14)),
                      Text('Event Date: ${user.eventDate}', style: const TextStyle(fontSize: 14)),
                      Text('Event Time: ${user.eventTime}', style: const TextStyle(fontSize: 14)),
                      Text('Event Pack: ${user.eventPack}', style: const TextStyle(fontSize: 14)),
                      Text('Event Setup Date: ${user.eventSetupDate}', style: const TextStyle(fontSize: 14)),
                      Text('Event Setup Time: ${user.eventSetupTime}', style: const TextStyle(fontSize: 14)),
                      Text('Agenda: ${user.agenda}', style: const TextStyle(fontSize: 14)),
                      Text('Date: ${user.date}', style: const TextStyle(fontSize: 14)),
                      Text('Time: ${user.time}', style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}